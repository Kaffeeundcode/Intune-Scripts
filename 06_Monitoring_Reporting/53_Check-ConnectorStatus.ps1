<#
.SYNOPSIS
    Checks Status of Intune Connectors (Exchange, Apple, etc.).
    
.DESCRIPTION
    Requires 'DeviceManagementServiceConfig.Read.All' permission.

.NOTES
    File Name: 53_Check-ConnectorStatus.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param()

Connect-MgGraph -Scopes "DeviceManagementServiceConfig.Read.All"

Write-Host "Checking Apple Push Certificate..."
$Apple = Get-MgDeviceManagementApplePushNotificationCertificate
if ($Apple) {
    Write-Host "Apple Push Cert: Expries $($Apple.ExpirationDateTime)"
} else {
    Write-Host "Apple Push Cert: Not Configured" -ForegroundColor Yellow
}

# Add other connectors as needed (Exchange, etc.)
# Exchange Connector: Get-MgDeviceManagementExchangeConnector
