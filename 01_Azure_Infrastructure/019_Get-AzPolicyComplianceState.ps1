<#
.SYNOPSIS
    Ruft den Compliance-Status von Azure Policies für eine Subscription oder Ressource ab.

.DESCRIPTION
    Zeigt an, ob Ressourcen "Compliant" oder "NonCompliant" sind.
    
    Parameter:
    - Scope: (Optional) Scope (Subscription ID oder RG Pfad). Default: Aktuelle Subscription.

.NOTES
    File Name: 019_Get-AzPolicyComplianceState.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [Parameter(Mandatory=$false)] [string]$Scope
)

try {
    if (-not $Scope) {
        $Scope = "/subscriptions/" + (Get-AzContext).Subscription.Id
    }

    Write-Host "Rufe Policy Status ab für Scope: $Scope" -ForegroundColor Cyan
    
    $States = Get-AzPolicyState -Scope $Scope -ErrorAction Stop
    
    $NonCompliant = $States | Where-Object ComplianceState -eq "NonCompliant"

    if ($NonCompliant) {
        Write-Warning "Es wurden $($NonCompliant.Count) Non-Compliant Ressourcen gefunden!"
        $NonCompliant | Select-Object PolicyDefinitionName, ResourceGroup, ResourceId, ComplianceState | Format-Table -AutoSize
    } else {
        Write-Host "Alles Compliant! (Oder keine Policies zugewiesen)" -ForegroundColor Green
    }

} catch {
    Write-Error "Fehler: $_"
}
