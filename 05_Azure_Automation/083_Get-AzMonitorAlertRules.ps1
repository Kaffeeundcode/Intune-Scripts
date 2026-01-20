<#
.SYNOPSIS
    Listet alle aktivierten Monitor Alert Rules auf.

.DESCRIPTION
    Zeigt, welche Alerts (Metrik oder Log) aktiv sind.
    
    Parameter:
    - ResourceGroupName: (Optional) Filter

.NOTES
    File Name: 083_Get-AzMonitorAlertRules.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [Parameter(Mandatory=$false)] [string]$ResourceGroupName
)

try {
    Write-Host "Rufe Alert Rules ab..." -ForegroundColor Cyan
    
    $Alerts = if ($ResourceGroupName) { Get-AzAlertRule -ResourceGroup $ResourceGroupName } else { Get-AzAlertRule }

    foreach ($a in $Alerts) {
        $Status = if ($a.IsEnabled) { "Aktiv" } else { "Deaktiviert" }
        Write-Host "Alert: $($a.Name)" -ForegroundColor Yellow
        Write-Host " - Status:      $Status"
        Write-Host " - Description: $($a.Description)"
        Write-Host " - Bedingung:   $($a.Condition.DataSource.MetricName) $($a.Condition.Operator) $($a.Condition.Threshold)"
    }

} catch {
    Write-Error "Fehler: $_"
}
