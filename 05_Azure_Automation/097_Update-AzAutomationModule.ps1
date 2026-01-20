<#
.SYNOPSIS
    Aktualisiert ein PowerShell-Modul im Automation Account.

.DESCRIPTION
    Module veralten und müssen gepflegt werden.
    Lädt die neueste Version aus der Gallery (indirekt Trigger via ContentLink).
    Hinweis: Azure Automation Module Updates sind oft einfacher via Portal, 
    dieses Skript zeigt den Programmatic Way via New-AzAutomationModule (Overwrite).

    Parameter:
    - ResourceGroupName: RG
    - AutomationAccountName: Account
    - ModuleName: Name (z.B. Az.Accounts)
    - ContentLinkUri: URL zur .nupkg oder Gallery Link

.NOTES
    File Name: 097_Update-AzAutomationModule.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [Parameter(Mandatory=$true)] [string]$ResourceGroupName,
    [Parameter(Mandatory=$true)] [string]$AutomationAccountName,
    [Parameter(Mandatory=$true)] [string]$ModuleName,
    [Parameter(Mandatory=$true)] [string]$ContentLinkUri
)

try {
    Write-Host "Aktualisiere/Installiere Modul '$ModuleName'..." -ForegroundColor Cyan

    New-AzAutomationModule -AutomationAccountName $AutomationAccountName `
                           -ResourceGroupName $ResourceGroupName `
                           -Name $ModuleName `
                           -ContentLinkUri $ContentLinkUri `
                           -ErrorAction Stop | Out-Null
                           
    Write-Host "Modulupdate angestoßen (Status 'Creating'...). Bitte warten." -ForegroundColor Green

} catch {
    Write-Error "Fehler: $_"
}
