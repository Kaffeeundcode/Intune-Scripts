<#
.SYNOPSIS
    Deletes the device object from Intune.
    
.DESCRIPTION
    This removes the device record from the Intune console. 
    It does NOT wipe the device. It just deletes the record (e.g. for stale devices).
    Requires 'DeviceManagementManagedDevices.ReadWrite.All' permission.

.NOTES
    File Name: 09_Delete-IntuneDevice.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [Parameter(Mandatory=$true)]
    [string]$DeviceName
)

Connect-MgGraph -Scopes "DeviceManagementManagedDevices.ReadWrite.All"

$Device = Get-MgDeviceManagementManagedDevice -Filter "deviceName eq '$DeviceName'"

if ($Device) {
    Write-Warning "Deleting device record '$($Device.DeviceName)' from Intune."
    Remove-MgDeviceManagementManagedDevice -ManagedDeviceId $Device.Id -ErrorAction Stop
    Write-Host "Device deleted." -ForegroundColor Green
} else {
    Write-Warning "Device '$DeviceName' not found."
}
