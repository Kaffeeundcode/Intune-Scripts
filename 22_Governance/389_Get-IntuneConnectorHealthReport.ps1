<#
.SYNOPSIS
    Prueft Apple-, Android- und Intune-Connector-Zustaende.
.DESCRIPTION
    <!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Kombiniert APNs-Zertifikat, VPP-Tokens, ADE-Tokens und Android-Bindung in einem
    Report. Ablaufdatum und Sync-Fehler werden separat ausgewertet.
.EXAMPLE
    ./22_Governance/389_Get-IntuneConnectorHealthReport.ps1 -OutputPath './reports/connector-health.csv'
#>
[CmdletBinding()]
param([string]$TenantId,[switch]$SkipConnect,[string]$OutputPath)

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
Connect-IlGraph -Scopes @('DeviceManagementServiceConfig.Read.All','DeviceManagementApps.Read.All') -TenantId $TenantId -SkipConnect:$SkipConnect
$result=New-Object 'System.Collections.Generic.List[object]'
try {
    $apns=Invoke-IlGraph 'https://graph.microsoft.com/v1.0/deviceManagement/applePushNotificationCertificate'
    $result.Add([pscustomobject][ordered]@{Status=if([string](Get-IlProperty $apns 'status') -match 'valid|active'){'OK'}else{'Auffaellig'};Connector='Apple APNs';Name=Get-IlProperty $apns 'appleIdentifier';Expiration=Get-IlProperty $apns 'expirationDateTime';LastError=$null;Detail="Status: $(Get-IlProperty $apns 'status')"})
} catch { $result.Add((New-IlFinding -Check 'AppleAPNs' -Status 'Nicht pruefbar' -Detail $_.Exception.Message)) }
foreach ($token in @(Get-IlGraphCollection 'https://graph.microsoft.com/v1.0/deviceAppManagement/vppTokens')) {
    $result.Add([pscustomobject][ordered]@{Status=if([string](Get-IlProperty $token 'state') -match 'valid|active'){'OK'}else{'Auffaellig'};Connector='Apple VPP';Name=Get-IlProperty $token 'displayName';Expiration=Get-IlProperty $token 'expirationDateTime';LastError=Get-IlProperty $token 'lastSyncErrorCode';Detail="Status: $(Get-IlProperty $token 'state')"})
}
foreach ($token in @(Get-IlGraphCollection 'https://graph.microsoft.com/beta/deviceManagement/depOnboardingSettings')) {
    $result.Add([pscustomobject][ordered]@{Status=if([int](Get-IlProperty $token 'lastSyncErrorCode' 0)){'Auffaellig'}else{'OK'};Connector='Apple ADE/DEP';Name=Get-IlProperty $token 'tokenName';Expiration=Get-IlProperty $token 'tokenExpirationDateTime';LastError=Get-IlProperty $token 'lastSyncErrorCode';Detail="Letzter Sync-Fehlercode: $(Get-IlProperty $token 'lastSyncErrorCode' 0)"})
}
try {
    $android=Invoke-IlGraph 'https://graph.microsoft.com/beta/deviceManagement/androidManagedStoreAccountEnterpriseSettings'
    $bindStatus=[string](Get-IlProperty $android 'bindStatus')
    $result.Add([pscustomobject][ordered]@{Status=if($bindStatus -eq 'boundAndValidated'){'OK'}else{'Auffaellig'};Connector='Android Enterprise';Name=Get-IlProperty $android 'ownerOrganizationName' (Get-IlProperty $android 'ownerUserPrincipalName');Expiration=$null;LastError=Get-IlProperty $android 'lastAppSyncStatus';Detail="Bindung: $bindStatus; App-Sync: $(Get-IlProperty $android 'lastAppSyncStatus')"})
} catch { $result.Add((New-IlFinding -Check 'AndroidEnterprise' -Status 'Nicht pruefbar' -Detail $_.Exception.Message)) }
if (-not $result.Count) {
    $result.Add((New-IlFinding -Check 'ConnectorHealth' -Status 'Nicht anwendbar' -Detail 'Keine Connector-Daten gefunden.'))
}
Export-IlResult -Data $result.ToArray() -OutputPath $OutputPath
