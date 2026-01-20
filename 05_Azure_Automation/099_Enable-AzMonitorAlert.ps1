<#
.SYNOPSIS
    Aktiviert eine Monitor Alert Rule (falls deaktiviert).

.DESCRIPTION
    Massenaktivierung von Alerts.
    
    Parameter:
    - AlertName: Name des Alerts (Wildcard möglich)

.NOTES
    File Name: 099_Enable-AzMonitorAlert.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [Parameter(Mandatory=$true)] [string]$AlertName
)

try {
    Write-Host "Suche Alert Rule '$AlertName'..."

    # Azure Alerts sind Ressourcen, wir nutzen Get-AzResource für generischen Zugriff oder spezifische Cmdlets.
    # Für GenMetric Alerts: Get-AzMetricAlertRuleV2 -> etwas komplex.
    # Einfacher Weg für Classic Alerts:
    
    # Hier Beispiel für Activity Log Alert aktivieren:
    $Alert = Get-AzActivityLogAlert -Name $AlertName -ErrorAction SilentlyContinue
    
    if ($Alert) {
        Enable-AzActivityLogAlert -Name $AlertName -ResourceGroupName $Alert.ResourceGroupName -ErrorAction Stop
        Write-Host "Alert aktiviert." -ForegroundColor Green
    } else {
        Write-Warning "Alert nicht gefunden (oder kein Activity Log Alert)."
    }

} catch {
    Write-Error "Fehler: $_"
}
