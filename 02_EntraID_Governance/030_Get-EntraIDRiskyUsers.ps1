<#
.SYNOPSIS
    Listet Benutzer mit erhöhtem Risiko-Level (Identity Protection).

.DESCRIPTION
    High Risk User sind wahrscheinlich kompromittiert.
    Dieses Skript filtert Benutzer nach 'RiskLevel'.

    Parameter:
    - MinRiskLevel: low, medium, high (Default: medium)

.NOTES
    File Name: 030_Get-EntraIDRiskyUsers.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [Parameter(Mandatory=$false)] 
    [ValidateSet("low","medium","high")]
    [string]$MinRiskLevel = "medium"
)

try {
    Write-Host "Suche Risky Users (Level >= $MinRiskLevel)..." -ForegroundColor Cyan

    $Users = Get-MgRiskyUser -All 

    $Filtered = switch ($MinRiskLevel) {
        "low"    { $Users | Where-Object { $_.RiskLevel -in @("low","medium","high") } }
        "medium" { $Users | Where-Object { $_.RiskLevel -in @("medium","high") } }
        "high"   { $Users | Where-Object { $_.RiskLevel -eq "high" } }
    }

    if ($Filtered) {
        $Filtered | Select-Object UserPrincipalName, RiskLevel, RiskState, RiskLastUpdatedDateTime | Format-Table
    } else {
        Write-Host "Keine Risikobenutzer gefunden." -ForegroundColor Green
    }

} catch {
    Write-Error "Fehler: $_"
}
