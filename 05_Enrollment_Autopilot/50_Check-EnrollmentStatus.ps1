<#
.SYNOPSIS
    Checks Enrollment Status of a specific Device ID.
    
.DESCRIPTION
    Requires 'DeviceManagementManagedDevices.Read.All' permission.

.NOTES
    File Name: 50_Check-EnrollmentStatus.ps1
    Author: Kaffee & Code Assistant
    Version: 1.0
#>

param(
    [Parameter(Mandatory=$true)]
    [string]$DeviceId
)

Connect-MgGraph -Scopes "DeviceManagementManagedDevices.Read.All"

$Device = Get-MgDeviceManagementManagedDevice -ManagedDeviceId $DeviceId -ErrorAction SilentlyContinue

if ($Device) {
    Write-Host "Device: $($Device.DeviceName)"
    Write-Host "Enrollment Type: $($Device.ManagementAgent)"
    Write-Host "Compliant: $($Device.ComplianceState)"
} else {
    Write-Warning "Device ID not found."
}
