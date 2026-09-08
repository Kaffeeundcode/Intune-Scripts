<#
.SYNOPSIS
    Lädt ein APNs Zertifikat hoch.

.DESCRIPTION
    <!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Aktualisiert das Apple Push Cert. Wichtig für iOS Management.
    Erfordert die Berechtigung 'DeviceManagementServiceConfig.ReadWrite.All'.

.NOTES
    File Name: 145_Upload-ApplePushCert.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

Write-Host "Bitte APNs Zertifikat über das Portal erneuern."
