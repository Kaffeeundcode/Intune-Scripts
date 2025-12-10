<#
.SYNOPSIS
    Exports all Intune Managed Devices to a CSV file.
    
.DESCRIPTION
    Retrieves all devices and exports key properties (Name, SERIAL, OS, User, Compliance) to CSV.
    Requires 'DeviceManagementManagedDevices.Read.All' permission.

.NOTES
    File Name: 10_Export-AllDevices.ps1
    Author: Kaffee & Code Assistant
    Version: 1.0
#>

param (
    [string]$Path = ".\IntuneDevicesExport.csv"
)

Connect-MgGraph -Scopes "DeviceManagementManagedDevices.Read.All"

Write-Host "Retrieving devices... (This may take time for large environments)"
$Devices = Get-MgDeviceManagementManagedDevice -All

if ($Devices) {
    $Devices | Select-Object DeviceName, SerialNumber, OperatingSystem, OSVersion, ComplianceState, UserPrincipalName, LastSyncDateTime | Export-Csv -Path $Path -NoTypeInformation
    Write-Host "Exported $($Devices.Count) devices to '$Path'." -ForegroundColor Green
} else {
    Write-Warning "No devices found."
}
