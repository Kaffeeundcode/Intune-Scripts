<#
.SYNOPSIS
    Zeigt die letzten Ausführungen einer Logic App an (Success/Failed).

.DESCRIPTION
    Hilft beim Monitoring von Workflows.
    
    Parameter:
    - ResourceGroupName: RG
    - Name: Logic App Name

.NOTES
    File Name: 092_Get-AzLogicAppRuns.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [Parameter(Mandatory=$true)] [string]$ResourceGroupName,
    [Parameter(Mandatory=$true)] [string]$Name
)

try {
    Write-Host "Prüfe Runs für '$Name'..." -ForegroundColor Cyan

    $Runs = Get-AzLogicAppRunHistory -ResourceGroupName $ResourceGroupName -Name $Name -ErrorAction Stop

    $Runs | Select-Object StartTime, Status, RunId, WaitEndTime | Format-Table -AutoSize

} catch {
    Write-Error "Fehler: $_"
}
