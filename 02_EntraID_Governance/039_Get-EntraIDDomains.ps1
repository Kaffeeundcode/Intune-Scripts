<#
.SYNOPSIS
    Listet alle verifizierten Domains im Tenant auf.

.DESCRIPTION
    Einfacher Report über alle Domains, ihren Status (Verified/Unverified) und Typ (Managed/Federated).
    
    Parameter:
    - OnlyVerified: Zeigt nur verifizierte Domains.

.NOTES
    File Name: 039_Get-EntraIDDomains.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [Parameter(Mandatory=$false)] [switch]$OnlyVerified
)

try {
    Write-Host "Rufe Domains ab..." -ForegroundColor Cyan

    $Filter = $null
    if ($OnlyVerified) { $Filter = "isVerified eq true" }

    $Domains = Get-MgDomain -Filter $Filter -All

    $Domains | Select-Object Id, AuthenticationType, IsVerified, IsDefault, SupportedServices | Format-Table -AutoSize

} catch {
    Write-Error "Fehler: $_"
}
