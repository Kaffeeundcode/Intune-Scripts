<#
.SYNOPSIS
    Renames a specific Intune Managed Device.
    
.DESCRIPTION
    This script renames a device in Intune. Note that the rename command might take some time to process on the device.
    Requires 'DeviceManagementManagedDevices.ReadWrite.All' permission.

.NOTES
    File Name: 03_Rename-IntuneDevice.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [Parameter(Mandatory=$true)]
    [string]$CurrentDeviceName,

    [Parameter(Mandatory=$true)]
    [string]$NewDeviceName
)

Connect-MgGraph -Scopes "DeviceManagementManagedDevices.ReadWrite.All"

$Device = Get-MgDeviceManagementManagedDevice -Filter "deviceName eq '$CurrentDeviceName'"

if ($Device) {
    Set-MgDeviceManagementManagedDeviceName -ManagedDeviceId $Device.Id -DeviceName $NewDeviceName
    Write-Host "Rename command sent. Old: '$CurrentDeviceName' -> New: '$NewDeviceName'." -ForegroundColor Green
    Write-Host "Note: It may take some time for the device to pick up the change."
} else {
    Write-Warning "Device '$CurrentDeviceName' not found."
}
