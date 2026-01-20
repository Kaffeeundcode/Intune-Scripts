<#
.SYNOPSIS
    Listet alle Authentication Strength Policies (FIDO2, MFA, etc.) auf.

.DESCRIPTION
    Authentication Strengths sind Teil der neuen Conditional Access Features.
    Dieses Skript zeigt, welche Policies definiert sind und welche Methoden sie erlauben.

.NOTES
    File Name: 028_Get-EntraIDAuthStrengthPolicy.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

try {
    Write-Host "Rufe Authentication Strength Policies ab..." -ForegroundColor Cyan

    $Policies = Get-MgPolicyAuthenticationStrengthPolicy -All
    
    foreach ($pol in $Policies) {
        Write-Host "Policy: $($pol.DisplayName)" -ForegroundColor Cyan
        Write-Host " - Typ: $($pol.PolicyType)"
        Write-Host " - Erlaubte Methoden:"
        
        # AllowedCombinations ist ein Array von Auth-Methoden
        foreach ($combo in $pol.AllowedCombinations) {
            Write-Host "   * $combo"
        }
        Write-Host ""
    }

} catch {
    Write-Error "Fehler: $_"
}
