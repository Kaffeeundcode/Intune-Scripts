<#
.SYNOPSIS
    Listet Verbindungen (Connections) im Automation Account auf.

.DESCRIPTION
    Wichtig für "Run As" Accounts oder Service Principle Connections.
    
    Parameter:
    - ResourceGroupName: RG
    - AutomationAccountName: Account

.NOTES
    File Name: 098_Get-AzAutomationConnection.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [Parameter(Mandatory=$true)] [string]$ResourceGroupName,
    [Parameter(Mandatory=$true)] [string]$AutomationAccountName
)

try {
    Write-Host "Lese Connections..." -ForegroundColor Cyan

    $Conns = Get-AzAutomationConnection -ResourceGroupName $ResourceGroupName -AutomationAccountName $AutomationAccountName
    
    foreach ($c in $Conns) {
        Write-Host "Connection: $($c.Name) (Type: $($c.ConnectionTypeName))"
    }

} catch {
    Write-Error "Fehler: $_"
}
