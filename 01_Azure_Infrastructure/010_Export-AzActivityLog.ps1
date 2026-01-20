<#
.SYNOPSIS
    Exportiert das Azure Activity Log der letzten X Tage in eine CSV-Datei.

.DESCRIPTION
    Das Activity Log enthält alle "Control Plane" Ereignisse (wer hat was wann erstellt/gelöscht/geändert).
    Dieses Skript exportiert diese Daten für Audit-Zwecke.

    Parameter:
    - Days: Anzahl der Tage (Default: 7)
    - OutputPath: Pfad zur CSV-Datei (Default: User Desktop)

.NOTES
    File Name: 010_Export-AzActivityLog.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [Parameter(Mandatory=$false)] [int]$Days = 7,
    [Parameter(Mandatory=$false)] [string]$OutputPath = "$HOME/Desktop/AzureActivityLog.csv"
)

try {
    $StartDate = (Get-Date).AddDays(-$Days)
    Write-Host "Rufe Activity Logs ab seit $($StartDate.ToString()) ..." -ForegroundColor Cyan

    # MaxRecord Limitierung beachten, ggf. Pagination erforderlich, hier vereinfacht.
    $Logs = Get-AzLog -StartTime $StartDate -ErrorAction Stop

    if ($Logs.Count -gt 0) {
        Write-Host "$($Logs.Count) Einträge gefunden. Exportiere nach '$OutputPath'..." -ForegroundColor Cyan
        
        $Logs | Select-Object EventTimestamp, Caller, OperationName, Status, ResourceGroupName, ResourceId | 
                Export-Csv -Path $OutputPath -NoTypeInformation -Delimiter ";" -Encoding UTF8
        
        Write-Host "Export erfolgreich." -ForegroundColor Green
    } else {
        Write-Warning "Keine Log-Einträge im gewählten Zeitraum gefunden."
    }

} catch {
    Write-Error "Fehler: $_"
}
