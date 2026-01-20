<#
.SYNOPSIS
    Prüft, ob Metrik-Alerts gefeuert (Fired) haben.

.DESCRIPTION
    Listet alle "Fired" Alerts in einer Subscription.
    
    Parameter:
    - TimeRange: Stunden zurück (Default: 24)

.NOTES
    File Name: 085_Get-AzMetricAlertStatus.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [Parameter(Mandatory=$false)] [int]$TimeRange = 24
)

try {
    Write-Host "Suche gefeuerte Alerts (letzte $TimeRange h)..." -ForegroundColor Cyan

    # Alerts liegen nicht direkt als Objekt vor, sondern müssen über Filter abgefragt werden
    $StartTime = (Get-Date).AddHours(-$TimeRange)
    
    $Alerts = Get-AzAlert -TimeRange $TimeRange -ErrorAction SilentlyContinue | Where-Object MonitorCondition -eq "Fired"

    if ($Alerts) {
        Write-Warning "$($Alerts.Count) aktive Alarme gefunden!"
        $Alerts | Select-Object Name, ResourceGroup, MonitorCondition, AlertState, Severity | Format-Table -AutoSize
    } else {
        Write-Host "Keine aktiven Alarme (Fired) gefunden." -ForegroundColor Green
    }

} catch {
    Write-Error "Fehler: $_"
}
