<#
.SYNOPSIS
    Inventory Report by Device Model.
    
.DESCRIPTION
    Summary of device models in the environment.
    Requires 'DeviceManagementManagedDevices.Read.All' permission.

.NOTES
    File Name: 59_Get-DeviceModelSummary.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param()

Connect-MgGraph -Scopes "DeviceManagementManagedDevices.Read.All"

$Devices = Get-MgDeviceManagementManagedDevice -All

if ($Devices) {
    $Devices | Group-Object Model | Sort-Object Count -Descending | Select-Object Name, Count | Format-Table
} else {
    Write-Warning "No devices found."
}
