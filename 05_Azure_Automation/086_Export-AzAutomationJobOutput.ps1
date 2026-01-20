<#
.SYNOPSIS
    Exportiert den Output eines bestimmten Automation Jobs.

.DESCRIPTION
    Hilft beim Debugging von fehlgeschlagenen Runbook-Jobs.
    
    Parameter:
    - ResourceGroupName: RG Name
    - AutomationAccountName: Account Name
    - JobId: GUID des Jobs

.NOTES
    File Name: 086_Export-AzAutomationJobOutput.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [Parameter(Mandatory=$true)] [string]$ResourceGroupName,
    [Parameter(Mandatory=$true)] [string]$AutomationAccountName,
    [Parameter(Mandatory=$true)] [string]$JobId
)

try {
    Write-Host "Rufe Output für Job $JobId ab..." -ForegroundColor Cyan

    $Output = Get-AzAutomationJobOutput -ResourceGroupName $ResourceGroupName `
                                        -AutomationAccountName $AutomationAccountName `
                                        -Id $JobId `
                                        -Stream Output `
                                        -ErrorAction Stop

    if ($Output) {
        Write-Host "--- Output Start ---" -ForegroundColor Yellow
        $Output.Summary
        Write-Host "--- Output Ende ---" -ForegroundColor Yellow
    } else {
        Write-Host "Kein Output vorhanden (oder Job lief ohne Ausgabe)."
    }

} catch {
    Write-Error "Fehler: $_"
}
