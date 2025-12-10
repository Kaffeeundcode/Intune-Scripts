<#
.SYNOPSIS
    Lists all Windows Autopilot Devices.
    
.DESCRIPTION
    Requires 'DeviceManagementServiceConfig.Read.All' permission.

.NOTES
    File Name: 41_Get-AutopilotDevices.ps1
    Author: Kaffee & Code Assistant
    Version: 1.0
#>

param()

Connect-MgGraph -Scopes "DeviceManagementServiceConfig.Read.All"

$Devices = Get-MgDeviceManagementWindowsAutopilotDeviceIdentity -All

if ($Devices) {
    $Devices | Select-Object SerialNumber, ProductKey, Manufacturer, Model, EnrollmentState | Format-Table -AutoSize
    Write-Host "Total Autopilot Devices: $($Devices.Count)" -ForegroundColor Green
} else {
    Write-Warning "No Autopilot devices found."
}
