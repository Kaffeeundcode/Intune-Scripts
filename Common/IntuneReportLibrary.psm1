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
