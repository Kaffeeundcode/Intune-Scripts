<#
.SYNOPSIS
    Retires specific Intune Managed Device (Enterprise Wipe).
    
.DESCRIPTION
    This script retires a device. This removes managed app data, settings, and email profiles assigned by Intune.
    The device is removed from Intune management but personal data is left intact.
    Requires 'DeviceManagementManagedDevices.ReadWrite.All' permission.

.NOTES
    File Name: 06_Retire-IntuneDevice.ps1
    Author: Kaffee & Code Assistant
    Version: 1.0
#>

param (
    [Parameter(Mandatory=$true)]
    [string]$DeviceName
)

Connect-MgGraph -Scopes "DeviceManagementManagedDevices.ReadWrite.All"

$Device = Get-MgDeviceManagementManagedDevice -Filter "deviceName eq '$DeviceName'"

if ($Device) {
    Write-Warning "You are about to RETIRE device '$($Device.DeviceName)'. This removes company data."
    $Confirm = Read-Host "Type 'RETIRE' to confirm"
    
    if ($Confirm -eq 'RETIRE') {
        Retire-MgDeviceManagementManagedDevice -ManagedDeviceId $Device.Id
        Write-Host "Retire command sent to $($Device.DeviceName)." -ForegroundColor Cyan
    }
} else {
    Write-Warning "Device '$DeviceName' not found."
}
