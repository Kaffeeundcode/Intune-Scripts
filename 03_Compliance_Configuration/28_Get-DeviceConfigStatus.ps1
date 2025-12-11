<#
.SYNOPSIS
    Gets Configuration Profile Status for a specific Device.
    
.DESCRIPTION
    Shows which profiles have Succeeded, Failed, or are Pending.
    Requires 'DeviceManagementConfiguration.Read.All' permission.

.NOTES
    File Name: 28_Get-DeviceConfigStatus.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param(
    [Parameter(Mandatory=$true)]
    [string]$DeviceName
)

Connect-MgGraph -Scopes "DeviceManagementConfiguration.Read.All", "DeviceManagementManagedDevices.Read.All"

$Device = Get-MgDeviceManagementManagedDevice -Filter "deviceName eq '$DeviceName'"
if (-not $Device) { Write-Error "Device not found"; exit }

# Get states
# This requires expanding or querying the relationship: managedDevices/{id}/deviceConfigurationStates
$States = Get-MgDeviceManagementManagedDeviceDeviceConfigurationState -ManagedDeviceId $Device.Id

if ($States) {
    $States | Select-Object DisplayName, State, Version | Format-Table -AutoSize
} else {
    Write-Host "No configuration states found."
}
