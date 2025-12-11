<#
.SYNOPSIS
    Finds Stale Devices (Inactive > 45 days).
    
.DESCRIPTION
    Lists devices that haven't synced in the specified period.
    Requires 'DeviceManagementManagedDevices.Read.All' permission.

.NOTES
    File Name: 54_Get-StaleDevices.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param(
    [int]$Days = 45
)

Connect-MgGraph -Scopes "DeviceManagementManagedDevices.Read.All"

$Date = (Get-Date).AddDays(-$Days)
Write-Host "Searching for devices inactive since $Date..."

$Devices = Get-MgDeviceManagementManagedDevice -All | Where-Object { $_.LastSyncDateTime -lt $Date }

if ($Devices) {
    $Devices | Select-Object DeviceName, LastSyncDateTime, OperatingSystem, UserPrincipalName | Format-Table
    Write-Host "Found $($Devices.Count) stale devices." -ForegroundColor Red
} else {
    Write-Host "No stale devices found." -ForegroundColor Green
}
