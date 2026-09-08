<#
.SYNOPSIS
    Listet Security Baselines auf.

.DESCRIPTION
    <!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Zeigt verfügbare MDM Security Baselines im Tenant.
    Erfordert die Berechtigung 'DeviceManagementConfiguration.Read.All'.

.NOTES
    File Name: 67_Get-SecurityBaselines.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param()

Connect-MgGraph -Scopes "DeviceManagementConfiguration.Read.All"

Get-MgDeviceManagementTemplate | Where-Object { $_.DisplayName -like "*Baseline*" } | Select-Object DisplayName, Id, VersionInfo
