<#
.SYNOPSIS
    Lädt die aktuellen Branding-Einstellungen des Tenants herunter.

.DESCRIPTION
    Exportiert Informationen wie Hintergrundbild-URL, Logo, Sign-In Text etc.
    Dient zur Dokumentation des Corporate Identitiy Status.

.NOTES
    File Name: 027_Get-EntraIDBranding.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

try {
    Write-Host "Rufe Company Branding ab..." -ForegroundColor Cyan

    # Branding ist oft eine Liste (pro Sprache)
    $Brandings = Get-MgOrganizationalBranding -All

    foreach ($b in $Brandings) {
        Write-Host "Sprache (Locale): $($b.Id)" -ForegroundColor Yellow
        Write-Host " - Sign-In Text:     $($b.SignInPageText -replace '<[^>]+>','')" # HTML strip
        Write-Host " - Hintergrund Bild: $($b.BackgroundImageRelativeUrl)"
        Write-Host " - Banner Logo:      $($b.BannerLogoRelativeUrl)"
        Write-Host " - User Hint Text:   $($b.UsernameHintText)"
        Write-Host "------------------------------------------------"
    }

} catch {
    Write-Error "Fehler (Benötigt OrganizationalBranding.Read.All): $_"
}
