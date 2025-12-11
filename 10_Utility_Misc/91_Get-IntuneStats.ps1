<#
.SYNOPSIS
    Dashboard: Intune Environment Statistics.
    
.DESCRIPTION
    Counts of Devices, Apps, Users, and Policies.
    Requires various Read.All permissions.

.NOTES
    File Name: 91_Get-IntuneStats.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

Connect-MgGraph -Scopes "DeviceManagementManagedDevices.Read.All", "DeviceManagementApps.Read.All", "User.Read.All"

$DevCount = (Get-MgDeviceManagementManagedDevice -All).Count
$AppCount = (Get-MgDeviceAppMgtMobileApp -All).Count
$UserCount = (Get-MgUser -All -ConsistencyLevel eventual).Count

Write-Host "--- Intune Environment Stats ---" -ForegroundColor Cyan
Write-Host "Total Managed Devices: $DevCount"
Write-Host "Total Mobile Apps: $AppCount"
Write-Host "Total Users: $UserCount"
