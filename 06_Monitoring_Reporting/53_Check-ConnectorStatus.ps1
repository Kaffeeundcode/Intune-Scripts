<#
.SYNOPSIS
    Prüft den Status der Intune Connectors (z.B. Chrome, TeamViewer).
    
.DESCRIPTION
    Listet Status von Partner-Connectors auf.
    Erfordert die Berechtigung 'DeviceManagementServiceConfig.Read.All'.

.NOTES
    File Name: 53_Check-ConnectorStatus.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param()

Connect-MgGraph -Scopes "DeviceManagementServiceConfig.Read.All"

# Generic check for mobileThreatDefenseConnectors as example
Get-MgDeviceManagementMobileThreatDefenseConnector | Select-Object DisplayName, AndroidDeviceBlockedOnMissingPartnerData, IosDeviceBlockedOnMissingPartnerData
