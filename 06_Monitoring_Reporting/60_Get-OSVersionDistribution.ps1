<#
.SYNOPSIS
    Inventory Report by OS Version.
    
.DESCRIPTION
    Summary of Operating Systems and versions.
    Requires 'DeviceManagementManagedDevices.Read.All' permission.

.NOTES
    File Name: 60_Get-OSVersionDistribution.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param()

Connect-MgGraph -Scopes "DeviceManagementManagedDevices.Read.All"

$Devices = Get-MgDeviceManagementManagedDevice -All

if ($Devices) {
    $Devices | Group-Object OperatingSystem, OSVersion | Sort-Object Count -Descending | Select-Object Name, Count | Format-Table
} else {
    Write-Warning "No devices found."
}
