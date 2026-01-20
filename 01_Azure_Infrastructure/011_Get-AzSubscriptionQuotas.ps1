<#
.SYNOPSIS
    Prüft die Nutzungsquoten (vCPUs) in einer Region und warnt bei hohem Verbrauch.

.DESCRIPTION
    Azure Subscriptions haben Limits für vCPUs pro Region. 
    Dieses Skript listet die aktuelle Auslastung auf, um Engpässe vor Deployments zu erkennen.

    Parameter:
    - Region: Azure Region (z.B. 'westeurope')

.NOTES
    File Name: 011_Get-AzSubscriptionQuotas.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [Parameter(Mandatory=$true)] [string]$Region
)

try {
    Write-Host "Rufe Quoten für Region '$Region' ab..." -ForegroundColor Cyan

    $Usages = Get-AzVMUsage -Location $Region -ErrorAction Stop

    $Critical = $Usages | Where-Object { $_.CurrentValue -gt ($_.Limit * 0.8) }

    if ($Critical) {
        Write-Warning "ACHTUNG: Folgende Quoten sind zu über 80% ausgelastet:"
        $Critical | Select-Object Name, CurrentValue, Limit | Format-Table -AutoSize
    } else {
        Write-Host "Alle Quoten im grünen Bereich (< 80%)." -ForegroundColor Green
    }
    
    # Übersicht aller Quoten (Top 10 nach Nutzung)
    Write-Host "`nTop 10 genutzte Quoten:" -ForegroundColor Cyan
    $Usages | Sort-Object CurrentValue -Descending | Select-Object -First 10 Name, CurrentValue, Limit, Unit | Format-Table

} catch {
    Write-Error "Fehler: $_"
}
