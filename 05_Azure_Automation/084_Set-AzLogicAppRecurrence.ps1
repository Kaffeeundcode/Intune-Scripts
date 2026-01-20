<#
.SYNOPSIS
    Aktiviert/Deaktiviert einen Logic App Trigger (Recurrence).

.DESCRIPTION
    Hilfreich um Logic Apps temporär zu stoppen (Wartung) oder zu starten.
    
    Parameter:
    - ResourceGroupName: RG Name
    - LogicAppName: Name der App
    - State: Enabled/Disabled

.NOTES
    File Name: 084_Set-AzLogicAppRecurrence.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [Parameter(Mandatory=$true)] [string]$ResourceGroupName,
    [Parameter(Mandatory=$true)] [string]$LogicAppName,
    [Parameter(Mandatory=$true)] [ValidateSet("Enabled","Disabled")] [string]$State
)

try {
    Write-Host "Setze Logic App '$LogicAppName' auf '$State'..." -ForegroundColor Cyan

    $App = Get-AzLogicApp -ResourceGroupName $ResourceGroupName -Name $LogicAppName -ErrorAction Stop
    
    if ($State -eq "Enabled") {
        Set-AzLogicApp -ResourceGroupName $ResourceGroupName -Name $LogicAppName -State Enabled -ErrorAction Stop | Out-Null
    } else {
        Set-AzLogicApp -ResourceGroupName $ResourceGroupName -Name $LogicAppName -State Disabled -ErrorAction Stop | Out-Null
    }

    Write-Host "Status aktualisiert." -ForegroundColor Green

} catch {
    Write-Error "Fehler: $_"
}
