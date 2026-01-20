<#
.SYNOPSIS
    Prüft den globalen Azure Service Health Status.

.DESCRIPTION
    Zeigt an, ob es aktuell Störungen in den abonnierten Regionen gibt.
    
    Parameter:
    - CoreServicesOnly: Filtert auf "Core" Services.

.NOTES
    File Name: 088_Get-AzServiceHealth.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

try {
    Write-Host "Rufe Azure Service Health Events ab..." -ForegroundColor Cyan

    # Service Health liegt in Activity Logs unter Kategorie 'ServiceHealth'
    
    $Events = Get-AzLog -StartTime (Get-Date).AddDays(-1) -Status "Active" | Where-Object { $_.Category.Value -eq "ServiceHealth" }

    if ($Events) {
        Write-Warning "Aktuelle Störungen gefunden!"
        $Events | Select-Object EventTimestamp, OperationName, Description | Format-Table -AutoSize
    } else {
        Write-Host "Keine aktiven Störungen in den letzten 24h gemeldet." -ForegroundColor Green
    }

} catch {
    Write-Error "Fehler: $_"
}
