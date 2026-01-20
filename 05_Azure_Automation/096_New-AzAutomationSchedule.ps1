<#
.SYNOPSIS
    Erstellt einen Zeitplan (Schedule) in Azure Automation.

.DESCRIPTION
    Schedules triggern Runbooks zu bestimmten Zeiten.
    
    Parameter:
    - Name: Schedule Name
    - StartTime: Wann geht es los?
    - DaysInterval: Alle X Tage (Default: 1 = täglich)

.NOTES
    File Name: 096_New-AzAutomationSchedule.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [Parameter(Mandatory=$true)] [string]$ResourceGroupName,
    [Parameter(Mandatory=$true)] [string]$AutomationAccountName,
    [Parameter(Mandatory=$true)] [string]$Name,
    [Parameter(Mandatory=$true)] [DateTime]$StartTime,
    [Parameter(Mandatory=$false)] [int]$DaysInterval = 1
)

try {
    Write-Host "Erstelle Schedule '$Name'..." -ForegroundColor Cyan

    New-AzAutomationSchedule -AutomationAccountName $AutomationAccountName `
                             -ResourceGroupName $ResourceGroupName `
                             -Name $Name `
                             -StartTime $StartTime `
                             -DayInterval $DaysInterval `
                             -ErrorAction Stop | Out-Null
                             
    Write-Host "Schedule erstellt." -ForegroundColor Green

} catch {
    Write-Error "Fehler: $_"
}
