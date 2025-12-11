<#
.SYNOPSIS
    Lists App Protection Policies (MAM).
    
.DESCRIPTION
    Retrieves list of Android and iOS App Protection Policies.
    Requires 'DeviceManagementApps.Read.All' permission.

.NOTES
    File Name: 20_Get-AppProtectionPolicies.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param()

Connect-MgGraph -Scopes "DeviceManagementApps.Read.All"

Write-Host "iOS Managed App Policies:"
$iOS = Get-MgDeviceAppMgtIosManagedAppProtection
$iOS | Select-Object DisplayName, IsAssigned, AppProtectionPolicyId | Format-Table

Write-Host "`nAndroid Managed App Policies:"
$Android = Get-MgDeviceAppMgtAndroidManagedAppProtection
$Android | Select-Object DisplayName, IsAssigned, AppProtectionPolicyId | Format-Table
