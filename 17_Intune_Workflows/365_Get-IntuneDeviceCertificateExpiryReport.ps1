<#
.SYNOPSIS
    Meldet abgelaufene und bald ablaufende Intune-Geraetezertifikate.
.DESCRIPTION
    <!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Verwendet den offiziellen Report AllDeviceCertificates und bewertet Ablaufdatum
    sowie gemeldeten Zertifikatstatus. Die Ausgabe enthaelt Richtlinie, Geraet,
    Benutzer, Aussteller und Thumbprint. Zertifikatinhalte oder private Schluessel
    werden nicht abgerufen.
.EXAMPLE
    ./17_Intune_Workflows/365_Get-IntuneDeviceCertificateExpiryReport.ps1 -WarningDays 45 -OutputPath './reports/certificate-expiry.csv'
#>
[CmdletBinding()]
param(
    [ValidateRange(1,365)][int]$WarningDays = 30,
    [switch]$IncludeHealthy,
    [string]$TenantId,
    [switch]$SkipConnect,
    [string]$OutputPath
)

# kc-bundle:graph:start sha256=168d7f232db5d14cf1be94255b5d535f3739213158e781a4214040a070571864
# Eingebettete Hilfslogik aus Common/IntuneLibrary.psm1; durch tools/bundle-script-dependencies.mjs gepflegt.
New-Module -Name IntuneLibrary -ScriptBlock {
#requires -Version 5.1
Set-StrictMode -Version Latest

function Connect-IlGraph {
    [CmdletBinding()]
    param([Parameter(Mandatory)][string[]]$Scopes, [string]$TenantId, [switch]$SkipConnect)
    if (-not (Get-Command Get-MgContext -ErrorAction SilentlyContinue)) {
        throw 'Microsoft.Graph.Authentication fehlt. Install-Module Microsoft.Graph.Authentication -Scope CurrentUser'
    }
    $context = Get-MgContext
    if (-not $SkipConnect -and (-not $context -or ($TenantId -and $context.TenantId -ne $TenantId))) {
        $arguments = @{ Scopes = $Scopes; ErrorAction = 'Stop'; NoWelcome = $true; ContextScope = 'Process' }
        if ($TenantId) { $arguments.TenantId = $TenantId }
        Connect-MgGraph @arguments | Out-Null
        $context = Get-MgContext
    }
    if (-not $context) { throw 'Keine aktive Graph-Sitzung.' }
    if ($TenantId -and $context.TenantId -ne $TenantId) { throw 'Die aktive Graph-Sitzung gehoert zu einem anderen Tenant.' }
    if ($context.AuthType -eq 'Delegated') {
        $missing = @($Scopes | Where-Object { $_ -notin $context.Scopes })
        if ($missing.Count) { throw "Der Sitzung fehlen angeforderte Scopes: $($missing -join ', '). Neu mit diesen Scopes anmelden." }
    }
}

function Assert-IlGraphUri {
    param([Parameter(Mandatory)][string]$Uri)
    $parsed = [uri]$Uri
    if (-not $parsed.IsAbsoluteUri -or $parsed.Scheme -ne 'https' -or $parsed.Host -ne 'graph.microsoft.com' -or $parsed.UserInfo -or $parsed.Port -ne 443) {
        throw 'Nur HTTPS-Anfragen an graph.microsoft.com sind erlaubt (Global Cloud).'
    }
    if ($parsed.AbsolutePath -notmatch '^/(v1\.0|beta)/') { throw 'Graph-API-Version fehlt.' }
}

function Invoke-IlGraph {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)][string]$Uri,
        [ValidateSet('GET','POST','PATCH','DELETE')][string]$Method = 'GET',
        [object]$Body,
        [ValidateRange(0,8)][int]$MaxRetries = 4
    )
    Assert-IlGraphUri $Uri
    for ($attempt = 0; ; $attempt++) {
        try {
            $arguments = @{ Uri = $Uri; Method = $Method; OutputType = 'PSObject'; ErrorAction = 'Stop' }
            if ($PSBoundParameters.ContainsKey('Body')) {
                $arguments.Body = ConvertTo-Json -InputObject $Body -Depth 100 -Compress
                $arguments.ContentType = 'application/json'
            }
            return Invoke-MgGraphRequest @arguments
        } catch {
            $status = 0
            $delay = [math]::Min(60, [math]::Pow(2, $attempt))
            if ($_.Exception.PSObject.Properties['Response'] -and $_.Exception.Response) {
                $response = $_.Exception.Response
                if ($response.PSObject.Properties['StatusCode']) { $status = [int]$response.StatusCode }
                if ($response.PSObject.Properties['Headers'] -and $response.Headers) {
                    try {
                        $retryAfter = $response.Headers.RetryAfter
                        if ($retryAfter.Delta) { $delay = [math]::Ceiling($retryAfter.Delta.TotalSeconds) }
                        elseif ($retryAfter.Date) { $delay = [math]::Ceiling(($retryAfter.Date - [DateTimeOffset]::UtcNow).TotalSeconds) }
                    } catch { Write-Verbose 'Retry-After nicht lesbar; exponentieller Backoff.' }
                }
            }
            # Mutationen niemals automatisch wiederholen: ihre Annahme kann unklar sein.
            if ($Method -ne 'GET' -or $status -notin @(429,503,504) -or $attempt -ge $MaxRetries) { throw }
            if ($delay -gt 300) { throw 'Server fordert mehr als 300 Sekunden Wartezeit; Lauf spaeter erneut starten.' }
            Start-Sleep -Seconds ([math]::Max(1,$delay))
        }
    }
}

function Get-IlGraphCollection {
    [CmdletBinding()]
    param([Parameter(Mandatory)][string]$Uri, [ValidateRange(1,100000)][int]$MaxPages = 10000)
    $seen = @{}
    $rows = New-Object 'System.Collections.Generic.List[object]'
    while ($Uri) {
        if ($seen.ContainsKey($Uri)) { throw 'Wiederholter Graph-nextLink; unvollstaendige Abfrage verworfen.' }
        if ($seen.Count -ge $MaxPages) { throw 'Seitenlimit erreicht; unvollstaendige Abfrage verworfen.' }
        $seen[$Uri] = $true
        $page = Invoke-IlGraph -Uri $Uri
        if (-not $page -or -not $page.PSObject.Properties['value']) { throw "Keine Graph-Collection: $Uri" }
        foreach ($row in @($page.value)) { if ($null -ne $row) { $rows.Add($row) } }
        $Uri = if ($page.PSObject.Properties['@odata.nextLink']) { [string]$page.'@odata.nextLink' } else { $null }
    }
    return $rows.ToArray()
}

function ConvertTo-IlSegment {
    param([Parameter(Mandatory)][ValidateNotNullOrEmpty()][string]$Value)
    return [uri]::EscapeDataString($Value)
}

function Resolve-IlDevice {
    [CmdletBinding(DefaultParameterSetName='Name')]
    param(
        [Parameter(Mandatory,ParameterSetName='Id')][string]$DeviceId,
        [Parameter(Mandatory,ParameterSetName='Name')][string]$DeviceName,
        [Parameter(Mandatory,ParameterSetName='Serial')][string]$SerialNumber
    )
    $base = 'https://graph.microsoft.com/v1.0/deviceManagement/managedDevices'
    if ($DeviceId) { return Invoke-IlGraph -Uri ($base + '/' + (ConvertTo-IlSegment $DeviceId)) }
    $field = if ($PSCmdlet.ParameterSetName -eq 'Serial') { 'serialNumber' } else { 'deviceName' }
    $value = if ($SerialNumber) { $SerialNumber } else { $DeviceName }
    $filter = [uri]::EscapeDataString("$field eq '$($value.Replace("'","''"))'")
    $devices = @(Get-IlGraphCollection -Uri ($base + '?$filter=' + $filter))
    if ($devices.Count -ne 1) { throw "$($devices.Count) Geraete gefunden. Eine eindeutige DeviceId verwenden." }
    return $devices[0]
}

function Get-IlProperty {
    param([AllowNull()][object]$Object, [Parameter(Mandatory)][string]$Name, [object]$Default = $null)
    if ($null -eq $Object) { return $Default }
    if ($Object -is [System.Collections.IDictionary]) {
        if ($Object.Contains($Name)) { return $Object[$Name] }
    } elseif ($Object.PSObject.Properties[$Name]) { return $Object.$Name }
    return $Default
}

function New-IlFinding {
    param([string]$Check, [ValidateSet('OK','Auffaellig','Nicht anwendbar','Nicht pruefbar')][string]$Status,
          [string]$ObjectId, [string]$Detail, [object]$Data)
    [pscustomobject][ordered]@{ Check=$Check; Status=$Status; ObjectId=$ObjectId; Detail=$Detail; Data=$Data }
}

function Export-IlResult {
    [CmdletBinding()]
    param([AllowNull()][object]$Data, [string]$OutputPath)
    if ($OutputPath) {
        $parent = Split-Path $OutputPath -Parent
        if ($parent -and -not (Test-Path -LiteralPath $parent)) { New-Item -ItemType Directory -Path $parent -Force | Out-Null }
        if ([IO.Path]::GetExtension($OutputPath) -eq '.csv') {
            @($Data) | Export-Csv -LiteralPath $OutputPath -NoTypeInformation -Encoding UTF8 -ErrorAction Stop
        } else {
            ConvertTo-Json -InputObject @($Data) -Depth 100 | Set-Content -LiteralPath $OutputPath -Encoding UTF8 -ErrorAction Stop
        }
    }
    return $Data
}

Export-ModuleMember -Function Connect-IlGraph,Invoke-IlGraph,Get-IlGraphCollection,ConvertTo-IlSegment,Resolve-IlDevice,Get-IlProperty,New-IlFinding,Export-IlResult

} | Import-Module -Scope Local -Force
# kc-bundle:graph:end
# kc-bundle:report:start sha256=7528259aa984c181a8e114d1586c9b91eb8d521cfb6233b4b0144570c888f49a
# Eingebettete Hilfslogik aus Common/IntuneReportLibrary.psm1; durch tools/bundle-script-dependencies.mjs gepflegt.
New-Module -Name IntuneReportLibrary -ScriptBlock {
#requires -Version 5.1
Set-StrictMode -Version Latest

function Assert-IlExportDownloadUri {
    param([Parameter(Mandatory)][string]$Uri)
    $parsed = [uri]$Uri
    if (-not $parsed.IsAbsoluteUri) {
        throw 'Ungueltige Export-Downloadadresse. Erwartet wird HTTPS auf Azure Blob Storage.'
    }
    $hostName = $parsed.DnsSafeHost.ToLowerInvariant()
    $allowedHost = $hostName.EndsWith('.blob.core.windows.net') -or $hostName.EndsWith('.blob.storage.azure.net')
    if ($parsed.Scheme -ne 'https' -or $parsed.UserInfo -or $parsed.Port -ne 443 -or -not $allowedHost) {
        throw 'Ungueltige Export-Downloadadresse. Erwartet wird HTTPS auf Azure Blob Storage.'
    }
}

function Invoke-IlReportExport {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)][ValidatePattern('^[A-Za-z0-9]+$')][string]$ReportName,
        [string]$Filter,
        [string[]]$Select,
        [ValidateSet('v1.0','beta')][string]$ApiVersion = 'beta',
        [ValidateRange(10,1800)][int]$MaxWaitSeconds = 300,
        [ValidateRange(1,30)][int]$PollIntervalSeconds = 3
    )
    $base = "https://graph.microsoft.com/$ApiVersion/deviceManagement/reports/exportJobs"
    $body = [ordered]@{ reportName=$ReportName; format='csv' }
    if ($Filter) { $body.filter = $Filter }
    if ($Select -and $Select.Count) { $body.select = @($Select) }

    $job = IntuneLibrary\Invoke-IlGraph -Uri $base -Method POST -Body $body
    $jobId = [string](IntuneLibrary\Get-IlProperty $job 'id')
    if (-not $jobId) { throw "Exportjob fuer $ReportName lieferte keine ID." }

    $deadline = [datetime]::UtcNow.AddSeconds($MaxWaitSeconds)
    $jobUri = "$base/$(IntuneLibrary\ConvertTo-IlSegment $jobId)"
    do {
        $state = IntuneLibrary\Invoke-IlGraph -Uri $jobUri
        $status = [string](IntuneLibrary\Get-IlProperty $state 'status')
        if ($status -eq 'completed') { break }
        if ($status -in @('failed','unknown')) {
            $reason = [string](IntuneLibrary\Get-IlProperty $state 'localizedFailureReason' (IntuneLibrary\Get-IlProperty $state 'error'))
            if (-not $reason) { $reason = 'kein Fehlertext gemeldet' }
            throw "Exportjob fuer $ReportName fehlgeschlagen: $reason"
        }
        if ([datetime]::UtcNow -ge $deadline) { throw "Zeitlimit fuer Exportjob $ReportName erreicht (Status: $status)." }
        Start-Sleep -Seconds $PollIntervalSeconds
    } while ($true)

    $downloadUri = [string](IntuneLibrary\Get-IlProperty $state 'url')
    if (-not $downloadUri) { throw "Abgeschlossener Exportjob fuer $ReportName lieferte keine Downloadadresse." }
    Assert-IlExportDownloadUri -Uri $downloadUri

    $temporaryRoot = Join-Path ([IO.Path]::GetTempPath()) ("kc-intune-export-" + [guid]::NewGuid().ToString('N'))
    $archivePath = Join-Path $temporaryRoot 'report.zip'
    $extractPath = Join-Path $temporaryRoot 'content'
    try {
        New-Item -ItemType Directory -Path $temporaryRoot -Force -ErrorAction Stop | Out-Null
        Invoke-WebRequest -Uri $downloadUri -OutFile $archivePath -UseBasicParsing -ErrorAction Stop | Out-Null
        Expand-Archive -LiteralPath $archivePath -DestinationPath $extractPath -Force -ErrorAction Stop
        $csvFiles = @(Get-ChildItem -LiteralPath $extractPath -Filter '*.csv' -File -Recurse -ErrorAction Stop)
        if (-not $csvFiles.Count) { throw "Exportarchiv fuer $ReportName enthaelt keine CSV-Datei." }
        $rows = New-Object 'System.Collections.Generic.List[object]'
        foreach ($csvFile in $csvFiles) {
            foreach ($row in @(Import-Csv -LiteralPath $csvFile.FullName -ErrorAction Stop)) { $rows.Add($row) }
        }
        return $rows.ToArray()
    } finally {
        if (Test-Path -LiteralPath $temporaryRoot) { Remove-Item -LiteralPath $temporaryRoot -Recurse -Force -ErrorAction SilentlyContinue }
    }
}

Export-ModuleMember -Function Invoke-IlReportExport

} | Import-Module -Scope Local -Force
# kc-bundle:report:end
Connect-IlGraph -Scopes @('DeviceManagementManagedDevices.Read.All','DeviceManagementConfiguration.Read.All') -TenantId $TenantId -SkipConnect:$SkipConnect
$rows = @(Invoke-IlReportExport -ReportName 'AllDeviceCertificates')
$result = New-Object 'System.Collections.Generic.List[object]'
$issueCount = 0
$warningDate = [datetimeoffset]::UtcNow.AddDays($WarningDays)

foreach ($row in $rows) {
    $rawDate = [string](Get-IlProperty $row 'ValidTo')
    $certificateStatus = [string](Get-IlProperty $row 'CertificateStatus')
    $validTo = [datetimeoffset]::MinValue
    $status = 'OK'
    $detail = 'Zertifikat liegt ausserhalb des Warnzeitraums.'
    $daysRemaining = $null
    if (-not [datetimeoffset]::TryParse($rawDate,[ref]$validTo)) {
        $status = 'Nicht pruefbar'; $detail = 'ValidTo ist nicht auswertbar.'
    } else {
        $daysRemaining = [math]::Floor(($validTo.ToUniversalTime() - [datetimeoffset]::UtcNow).TotalDays)
        if ($validTo.ToUniversalTime() -lt [datetimeoffset]::UtcNow) { $status='Auffaellig'; $detail="Zertifikat ist seit $(-$daysRemaining) Tagen abgelaufen." }
        elseif ($validTo.ToUniversalTime() -le $warningDate) { $status='Auffaellig'; $detail="Zertifikat laeuft in $daysRemaining Tagen ab." }
    }
    if ($certificateStatus -match '(?i)revok|fail|error|expired|invalid') { $status='Auffaellig'; $detail="Gemeldeter Zertifikatstatus: $certificateStatus" }
    if ($status -ne 'OK') { $issueCount++ }
    if ($IncludeHealthy -or $status -ne 'OK') {
        $result.Add([pscustomobject][ordered]@{
            Status=$status;CertificateStatus=$certificateStatus;ValidTo=$rawDate;DaysRemaining=$daysRemaining;PolicyId=Get-IlProperty $row 'PolicyId'
            DeviceId=Get-IlProperty $row 'DeviceId';DeviceName=Get-IlProperty $row 'DeviceName';UPN=Get-IlProperty $row 'UPN';IssuerName=Get-IlProperty $row 'IssuerName'
            SubjectName=Get-IlProperty $row 'SubjectName';SerialNumber=Get-IlProperty $row 'SerialNumber';Thumbprint=Get-IlProperty $row 'Thumbprint';Detail=$detail
        })
    }
}

if (-not $rows.Count) {
    $result.Add((New-IlFinding -Check 'AllDeviceCertificates' -Status 'Nicht anwendbar' -Detail 'Der Exportreport enthaelt keine Geraetezertifikate.'))
} elseif (-not $issueCount -and -not $IncludeHealthy) {
    $result.Add((New-IlFinding -Check 'CertificateExpiry' -Status OK -Detail "$($rows.Count) Zertifikate ohne Ablauf- oder Statuswarnung innerhalb von $WarningDays Tagen."))
}
Export-IlResult -Data $result.ToArray() -OutputPath $OutputPath
