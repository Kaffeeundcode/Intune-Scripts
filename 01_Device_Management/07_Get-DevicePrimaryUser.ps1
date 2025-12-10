<#
.SYNOPSIS
    Gets the Primary User of a specific Intune Managed Device.
    
.DESCRIPTION
    Retrieves the user associated as the Primary User for the device.
    Requires 'DeviceManagementManagedDevices.Read.All' permission.

.NOTES
    File Name: 07_Get-DevicePrimaryUser.ps1
    Author: Kaffee & Code Assistant
    Version: 1.0
#>

param (
    [Parameter(Mandatory=$true)]
    [string]$DeviceName
)

Connect-MgGraph -Scopes "DeviceManagementManagedDevices.Read.All"

$Device = Get-MgDeviceManagementManagedDevice -Filter "deviceName eq '$DeviceName'"

if ($Device) {
    Write-Host "Device: $($Device.DeviceName)"
    Write-Host "Primary User UPN: $($Device.UserPrincipalName)" -ForegroundColor Green
    Write-Host "Primary User ID: $($Device.UserId)"
} else {
    Write-Warning "Device '$DeviceName' not found."
}
