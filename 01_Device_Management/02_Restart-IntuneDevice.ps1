<#
.SYNOPSIS
    Restarts a specific Intune Managed Device remotely.
    
.DESCRIPTION
    This script sends a remote restart command to the specified device.
    WARNING: This will restart the user's device immediately (or as soon as it checks in).
    Requires 'DeviceManagementManagedDevices.ReadWrite.All' permission.

.NOTES
    File Name: 02_Restart-IntuneDevice.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [Parameter(Mandatory=$true, HelpMessage="The name of the device to restart")]
    [string]$DeviceName
)

# Connect
Connect-MgGraph -Scopes "DeviceManagementManagedDevices.ReadWrite.All"

# Get Device
$Device = Get-MgDeviceManagementManagedDevice -Filter "deviceName eq '$DeviceName'"

if ($Device) {
    $Confirm = Read-Host "Are you sure you want to RESTART '$($Device.DeviceName)'? (y/n)"
    if ($Confirm -eq 'y') {
        # Trigger Restart
        Restart-MgDeviceManagementManagedDevice -ManagedDeviceId $Device.Id
        Write-Host "Restart command sent to $($Device.DeviceName)." -ForegroundColor Cyan
    } else {
        Write-Host "Operation cancelled." -ForegroundColor Yellow
    }
} else {
    Write-Warning "Device '$DeviceName' not found."
}
