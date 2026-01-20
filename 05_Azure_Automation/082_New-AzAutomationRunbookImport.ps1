<#
.SYNOPSIS
    Importiert ein lokales PowerShell-Skript als Runbook in Azure Automation.

.DESCRIPTION
    Automatisierter Deployment-Prozess für Runbooks.
    
    Parameter:
    - ResourceGroupName: RG Name
    - AutomationAccountName: Automation Account Name
    - Path: Pfad zur lokalen .ps1 Datei
    - RunbookName: Name in Azure (Default: Dateiname ohne .ps1)

.NOTES
    File Name: 082_New-AzAutomationRunbookImport.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [Parameter(Mandatory=$true)] [string]$ResourceGroupName,
    [Parameter(Mandatory=$true)] [string]$AutomationAccountName,
    [Parameter(Mandatory=$true)] [string]$Path,
    [Parameter(Mandatory=$false)] [string]$RunbookName
)

try {
    if (-not $RunbookName) {
        $RunbookName = [System.IO.Path]::GetFileNameWithoutExtension($Path)
    }

    Write-Host "Importiere Runbook '$RunbookName' nach '$AutomationAccountName'..." -ForegroundColor Cyan

    Import-AzAutomationRunbook -Path $Path `
                               -Name $RunbookName `
                               -Type PowerShell `
                               -AutomationAccountName $AutomationAccountName `
                               -ResourceGroupName $ResourceGroupName `
                               -Force -ErrorAction Stop | Out-Null
    
    Write-Host "Veröffentliche Runbook..."
    Publish-AzAutomationRunbook -Name $RunbookName `
                                -AutomationAccountName $AutomationAccountName `
                                -ResourceGroupName $ResourceGroupName `
                                -ErrorAction Stop | Out-Null

    Write-Host "Runbook erfolgreich importiert und veröffentlicht." -ForegroundColor Green

} catch {
    Write-Error "Fehler: $_"
}
