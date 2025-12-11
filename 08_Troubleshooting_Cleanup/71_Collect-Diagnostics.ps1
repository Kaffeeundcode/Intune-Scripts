<#
.SYNOPSIS
    Triggers Remote Log Collection for a Device.
    
.DESCRIPTION
    Sends command to collect diagnostics logs from the device.
    Requires 'DeviceManagementManagedDevices.ReadWrite.All' permission.

.NOTES
    File Name: 71_Collect-Diagnostics.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param(
    [Parameter(Mandatory=$true)]
    [string]$DeviceName
)

Connect-MgGraph -Scopes "DeviceManagementManagedDevices.ReadWrite.All"

$Device = Get-MgDeviceManagementManagedDevice -Filter "deviceName eq '$DeviceName'"
if ($Device) {
    # Send Log Collection Request
    $ReqId = Invoke-MgDeviceManagementManagedDeviceLogCollectionRequest -ManagedDeviceId $Device.Id
    # Note: Command structure varies, usually returns an DownloadUrl object or JobId once complete.
    Write-Host "Log collection requested for $($Device.DeviceName). Check Device Diagnostics tab later." -ForegroundColor Green
} else {
    Write-Error "Device not found"
}
