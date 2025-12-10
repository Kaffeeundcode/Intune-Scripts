<#
.SYNOPSIS
    Lists usage of Non-Compliant Devices.
    
.DESCRIPTION
    Filters all managed devices to show only those with ComplianceState = 'nonCompliant'.
    Requires 'DeviceManagementManagedDevices.Read.All' permission.

.NOTES
    File Name: 22_Get-NonCompliantDevices.ps1
    Author: Kaffee & Code Assistant
    Version: 1.0
#>

param()

Connect-MgGraph -Scopes "DeviceManagementManagedDevices.Read.All"

Write-Host "Searching for non-compliant devices..."
$Devices = Get-MgDeviceManagementManagedDevice -Filter "complianceState eq 'nonCompliant'" -All

if ($Devices) {
    $Devices | Select-Object DeviceName, UserPrincipalName, OperatingSystem, ComplianceState, LastSyncDateTime | Format-Table -AutoSize
    Write-Host "Found $($Devices.Count) non-compliant devices." -ForegroundColor Red
} else {
    Write-Host "No non-compliant devices found! Great job." -ForegroundColor Green
}
