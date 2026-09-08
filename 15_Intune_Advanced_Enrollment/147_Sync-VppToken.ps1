<#
.SYNOPSIS
    Startet Synchronisation eines VPP Tokens.

.DESCRIPTION
    <!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Aktualisiert Apps und Lizenzen von Apple Business Manager.
    Erfordert die Berechtigung 'DeviceManagementApps.ReadWrite.All'.

.NOTES
    File Name: 147_Sync-VppToken.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [string]$TokenId
)

Connect-MgGraph -Scopes "DeviceManagementApps.ReadWrite.All"

Invoke-MgSyncDeviceAppMgtVppToken -VppTokenId $TokenId
Write-Host "Sync gestartet."
