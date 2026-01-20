<#
.SYNOPSIS
    Entfernt eine Diagnostic Setting Konfiguration von einer Ressource.

.DESCRIPTION
    Bereinigt alte Log-Forwarding Regeln.
    
    Parameter:
    - ResourceId: ID der Azure Ressource
    - Name: Name des Diagnostic Settings

.NOTES
    File Name: 094_Remove-AzDiagnosticSetting.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [Parameter(Mandatory=$true)] [string]$ResourceId,
    [Parameter(Mandatory=$true)] [string]$Name
)

try {
    Write-Host "Entferne Diagnostic Setting '$Name'..." -ForegroundColor Cyan

    Remove-AzDiagnosticSetting -ResourceId $ResourceId -Name $Name -ErrorAction Stop
    
    Write-Host "Setting entfernt." -ForegroundColor Green

} catch {
    Write-Error "Fehler: $_"
}
