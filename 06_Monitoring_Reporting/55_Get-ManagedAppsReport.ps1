<#
.SYNOPSIS
    Bericht über verwaltete Apps.

.DESCRIPTION
    <!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Listet alle Apps und deren Installationszahlen (grob) auf, sofern verfügbar.
    Erfordert die Berechtigung 'DeviceManagementApps.Read.All'.

.NOTES
    File Name: 55_Get-ManagedAppsReport.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param()

Connect-MgGraph -Scopes "DeviceManagementApps.Read.All"

$Apps = Get-MgDeviceAppMgtMobileApp -All
# Note: Graph API implementation of install counts is specific. Simple object dump here.
$Apps | Select-Object DisplayName, InformationUrl, Owner | Format-Table -AutoSize
