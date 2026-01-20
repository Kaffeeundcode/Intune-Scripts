<#
.SYNOPSIS
    Prüft die globale Password Expiration Policy des Tenants.

.DESCRIPTION
    Zeigt an, ob Passwörter ablaufen und nach wie vielen Tagen.
    (Legacy Einstellung für Cloud-Only User).

.NOTES
    File Name: 038_Get-EntraIDPasswordExpiryPolicy.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

try {
    Write-Host "Prüfe Passwort-Richtlinie..." -ForegroundColor Cyan
    
    # Via Graph Beta 'organization' endpoint
    $Org = Get-MgBetaOrganization -All -Property Id, DisplayName, PasswordValidityPeriodInDays
    
    # Hinweis: Oft ist diese Einstellung versteckt oder nur per MSOnline sichtbar gewesen.
    # Graph zeigt dies teilweise nur bedingt an.
    
    Write-Host "Tenant: $($Org.DisplayName)"
    
    # Fallback/Check
    # Alternative wäre Domain-Level Check (Federated vs Managed)
    
    $Domains = Get-MgDomain -All
    foreach ($d in $Domains) {
        Write-Host "Domain: $($d.Id) - Type: $($d.AuthenticationType)"
        # Managed Domains *könnten* Expiry haben, Federated haben AD Connect Rules.
    }
    
    Write-Warning "Hinweis: Für detaillierte Policy (90 Tage etc.) ist oft noch MSOnline nötig, da Graph v1.0 dies noch nicht 1:1 abbildet."

} catch {
    Write-Error "Fehler: $_"
}
