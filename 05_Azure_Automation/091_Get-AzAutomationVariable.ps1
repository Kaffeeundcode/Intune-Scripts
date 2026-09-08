<#
.SYNOPSIS
    Liest eine Variable aus Azure Automation aus (verschlüsselt oder unverschlüsselt).

.DESCRIPTION
    <!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Dient dazu, Konfigurationswerte in Runbooks zu verwenden.

    Parameter:
    - AutomationAccountName: Account
    - ResourceGroupName: RG
    - Name: Variablenname

.NOTES
    File Name: 091_Get-AzAutomationVariable.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [Parameter(Mandatory=$true)] [string]$AutomationAccountName,
    [Parameter(Mandatory=$true)] [string]$ResourceGroupName,
    [Parameter(Mandatory=$true)] [string]$Name
)

try {
    Write-Host "Rufe Variable '$Name' ab..." -ForegroundColor Cyan

    $Var = Get-AzAutomationVariable -ResourceGroupName $ResourceGroupName `
                                    -AutomationAccountName $AutomationAccountName `
                                    -Name $Name `
                                    -ErrorAction Stop

    if ($Var.Encrypted) {
        Write-Warning "Variable ist verschlüsselt. Wert kann nur innerhalb eines Runbooks entschlüsselt werden."
        # In Runbook: Get-AutomationVariable -Name 'x'
    } else {
        Write-Host "Wert: $($Var.Value)" -ForegroundColor Green
    }

} catch {
    Write-Error "Fehler: $_"
}
