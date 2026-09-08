<#
.SYNOPSIS
    Listet alle Konfigurationsprofile (Device Configuration) auf.

.DESCRIPTION
    <!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Ruft alle Konfigurationsprofile ab, inkl. Settings Catalog und Admin Templates.
    Erfordert die Berechtigung 'DeviceManagementConfiguration.Read.All'.

.NOTES
    File Name: 24_Get-ConfigurationProfiles.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param()

Connect-MgGraph -Scopes "DeviceManagementConfiguration.Read.All"

$Profiles = Get-MgDeviceManagementDeviceConfiguration -All

Write-Host "Anzahl Profile: $($Profiles.Count)" -ForegroundColor Cyan
$Profiles | Select-Object DisplayName, Id, LastModifiedDateTime | Format-Table -AutoSize
