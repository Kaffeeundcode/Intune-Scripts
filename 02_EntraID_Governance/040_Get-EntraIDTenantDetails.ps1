<#
.SYNOPSIS
    Zeit Details zum Tenant (ID, Name, Technischer Kontakt) an.

.DESCRIPTION
    Basis-Informationen über den eigenen Tenant. Hilfreich für Dokumentation.

.NOTES
    File Name: 040_Get-EntraIDTenantDetails.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

try {
    $Org = Get-MgOrganization -All
    
    Write-Host "Tenant Details:" -ForegroundColor Cyan
    Write-Host "name:           $($Org.DisplayName)"
    Write-Host "ID:             $($Org.Id)"
    Write-Host "Primary Domain: $($Org.VerifiedDomains | Where-Object IsDefault -eq $true | Select-Object -ExpandProperty Name)"
    
    # Technical Contact
    Write-Host "Technical Contacts:"
    $Org.TechnicalNotificationMails | ForEach-Object { Write-Host " - $_" }

} catch {
    Write-Error "Fehler: $_"
}
