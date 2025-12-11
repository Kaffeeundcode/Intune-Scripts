<#
.SYNOPSIS
    Wipes (Factory Resets) a specific Intune Managed Device.
    
.DESCRIPTION
    This script sends a WIPE command. This is destructive and will remove all data from the device.
    You can choose to keep the enrollment state (RetainEnrollmentState) or do a full factory reset.
    Requires 'DeviceManagementManagedDevices.ReadWrite.All' permission.

.NOTES
    File Name: 04_Wipe-IntuneDevice.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [Parameter(Mandatory=$true)]
    [string]$DeviceName,

    [Parameter(Mandatory=$false)]
    [switch]$KeepEnrollmentData,

    [Parameter(Mandatory=$false)]
    [switch]$KeepUserData
)

Connect-MgGraph -Scopes "DeviceManagementManagedDevices.ReadWrite.All"

$Device = Get-MgDeviceManagementManagedDevice -Filter "deviceName eq '$DeviceName'"

if ($Device) {
    Write-Warning "DANGER: You are about to WIPE device '$($Device.DeviceName)'."
    $Confirm = Read-Host "Type 'WIPE' to confirm this action"
    
    if ($Confirm -eq 'WIPE') {
        Wipe-MgDeviceManagementManagedDevice -ManagedDeviceId $Device.Id -KeepEnrollmentData:$KeepEnrollmentData -KeepUserData:$KeepUserData
        
        Write-Host "Wipe command sent to $($Device.DeviceName)." -ForegroundColor Red
    } else {
        Write-Host "Wipe cancelled." -ForegroundColor Green
    }
} else {
    Write-Warning "Device '$DeviceName' not found."
}
