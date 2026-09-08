<#
.SYNOPSIS
    Installiert das Microsoft.Graph Modul.

.DESCRIPTION
    <!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Lädt das SDK aus der PSGallery.

.NOTES
    File Name: 96_Install-IntuneModule.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

Install-Module Microsoft.Graph -Scope CurrentUser -Force
Write-Host "Modul installiert."
