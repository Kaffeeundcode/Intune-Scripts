<#
.SYNOPSIS
    Ruft die angefallenen Kosten für eine bestimmte Azure Resource Group ab.

.DESCRIPTION
    Dieses Skript analysiert die Kosten einer Resource Group für einen bestimmten Zeitraum (Standard: letzte 30 Tage).
    Es verwendet das 'Az'-Modul (Az.CostManagement).
    
    Parameter:
    - ResourceGroupName: Name der Ressourcengruppe
    - DaysBack: Zeitraum in Tagen (Standard: 30)

.NOTES
    File Name: 001_Get-AzResourceGroupCosts.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [Parameter(Mandatory=$true, HelpMessage="Name der Azure Resource Group")]
    [string]$ResourceGroupName,

    [Parameter(Mandatory=$false, HelpMessage="Anzahl der Tage rückwirkend (Default: 30)")]
    [int]$DaysBack = 30
)

try {
    # Prüfung auf Az-Modul
    if (-not (Get-Module -ListAvailable -Name Az.Accounts)) {
        Throw "Das Modul 'Az.Accounts' wurde nicht gefunden. Bitte installieren Sie es mit 'Install-Module Az'."
    }

    # Login prüfen
    if (-not (Get-AzContext)) {
        Write-Warning "Keine aktive Azure-Sitzung gefunden. Bitte melden Sie sich an."
        Connect-AzAccount -ErrorAction Stop
    }

    $StartDate = (Get-Date).AddDays(-$DaysBack)
    $EndDate = (Get-Date)
    
    Write-Host "Rufe Kosten für Resource Group '$ResourceGroupName' ab ($($StartDate.ToShortDateString()) - $($EndDate.ToShortDateString()))..." -ForegroundColor Cyan

    # Kosten abrufen
    # Hinweis: Scope für RG ist: /subscriptions/{subId}/resourceGroups/{rgName}
    $SubId = (Get-AzContext).Subscription.Id
    $Scope = "/subscriptions/$SubId/resourceGroups/$ResourceGroupName"

    $Cost = Get-AzCostManagementQuery -Scope $Scope -Timeframe Custom -TimePeriod @{From=$StartDate; To=$EndDate} -DatasetAggregation @{TotalCost="Sum"} -DatasetGrouping @{Name="ResourceGroup"} -ErrorAction Stop

    if ($Cost) {
        Write-Host "Gesamtkosten:" -ForegroundColor Green
        $Cost | Format-Table -Property UsageDate, Cost, Currency
    } else {
        Write-Host "Keine Kostendaten gefunden oder 0,00." -ForegroundColor Yellow
    }

} catch {
    Write-Error "Fehler beim Abrufen der Kosten: $_"
}
