<#
.SYNOPSIS
    Prüft APNs Zertifikat-Status.

.DESCRIPTION
    <!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Zeigt Ablaufdatum des Apple Push Certs.
    Erfordert die Berechtigung 'DeviceManagementServiceConfig.Read.All'.

.NOTES
    File Name: 144_Get-ApplePushNotificationStatus.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param()

Connect-MgGraph -Scopes "DeviceManagementServiceConfig.Read.All"
Get-MgDeviceManagementApplePushNotificationCertificate | Select-Object AppleIdentifier, ExpirationDateTime, LastModifiedDateTime
