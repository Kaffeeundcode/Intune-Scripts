<#
.SYNOPSIS
    Checks Intune Service Health (via Tenant Status).
    
.DESCRIPTION
    Requires 'DeviceManagementServiceConfig.Read.All' permission.

.NOTES
    File Name: 57_Get-IntuneServiceHealth.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param()

Connect-MgGraph -Scopes "DeviceManagementServiceConfig.Read.All"

# Gets high level tenant status
$Status = Get-MgDeviceManagement -Property "subscriptionState"

if ($Status) {
    Write-Host "Tenant Subscription State: $($Status.SubscriptionState)" -ForegroundColor Green
}
