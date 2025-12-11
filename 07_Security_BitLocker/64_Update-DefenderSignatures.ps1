<#
.SYNOPSIS
    Triggers Defender Signature Update.
    
.DESCRIPTION
    Sends command to update AV definitions.
    Requires 'DeviceManagementManagedDevices.ReadWrite.All' permission.

.NOTES
    File Name: 64_Update-DefenderSignatures.ps1
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
    Invoke-MgDeviceManagementManagedDeviceWindowsDefenderUpdateSignature -ManagedDeviceId $Device.Id
    Write-Host "Signature update command sent to $($Device.DeviceName)." -ForegroundColor Green
}
