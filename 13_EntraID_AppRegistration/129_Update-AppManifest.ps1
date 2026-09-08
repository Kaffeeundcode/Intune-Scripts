<#
.SYNOPSIS
    Aktualisiert das App-Manifest (Advanced).

.DESCRIPTION
    <!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Lädt ein JSON hoch, um das Manifest zu ändern.
    Erfordert die Berechtigung 'Application.ReadWrite.All'.

.NOTES
    File Name: 129_Update-AppManifest.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

Write-Host "Manifest-Updates sollten vorsichtig via UI oder spezifischen Property-Settern gemacht werden."
