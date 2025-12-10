<#
.SYNOPSIS
    Deletes a Windows Autopilot Device Identity.
    
.DESCRIPTION
    Removes the hardware identity from Autopilot service.
    Requires 'DeviceManagementServiceConfig.ReadWrite.All' permission.

.NOTES
    File Name: 46_Delete-AutopilotDevice.ps1
    Author: Kaffee & Code Assistant
    Version: 1.0
#>

param(
    [Parameter(Mandatory=$true)]
    [string]$SerialNumber
)

Connect-MgGraph -Scopes "DeviceManagementServiceConfig.ReadWrite.All"

$Device = Get-MgDeviceManagementWindowsAutopilotDeviceIdentity -Filter "serialNumber eq '$SerialNumber'"

if ($Device) {
    Write-Warning "Deleting Autopilot Record for SN: $SerialNumber"
    Remove-MgDeviceManagementWindowsAutopilotDeviceIdentity -WindowsAutopilotDeviceIdentityId $Device.Id
    Write-Host "Deleted." -ForegroundColor Green
} else {
    Write-Host "Device not found."
}
