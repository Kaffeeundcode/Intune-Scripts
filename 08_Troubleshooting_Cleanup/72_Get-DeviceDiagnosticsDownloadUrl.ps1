<#
.SYNOPSIS
    Holt Download-URL für Diagnoseprotokolle.

.DESCRIPTION
    <!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Wenn 'Collect Diagnostics' fertig ist, kann hier die URL abgerufen werden.
    Erfordert die Berechtigung 'DeviceManagementManagedDevices.Read.All'.

.NOTES
    File Name: 72_Get-DeviceDiagnosticsDownloadUrl.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [string]$DeviceName
)

# Implementation logic: check deviceLogCollectionRequests endpoint
Write-Host "Prüfung auf verfügbare Log-Downloads..."
