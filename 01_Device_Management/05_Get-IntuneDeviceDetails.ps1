<#
.SYNOPSIS
    Gets detailed information about a device.
    
.DESCRIPTION
    Retrieves the full object of a managed device and exports it or displays it.
    Useful for auditing or troubleshooting properties like IMEI, SerialNumber, LastSyncDateTime.
    Requires 'DeviceManagementManagedDevices.Read.All' permission.

.NOTES
    File Name: 05_Get-IntuneDeviceDetails.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [Parameter(Mandatory=$true)]
    [string]$DeviceName
)

Connect-MgGraph -Scopes "DeviceManagementManagedDevices.Read.All"

$Device = Get-MgDeviceManagementManagedDevice -Filter "deviceName eq '$DeviceName'"

if ($Device) {
    # Display Key Properties
    $Device | Select-Object DeviceName, Id, SerialNumber, Manufacturer, Model, OperatingSystem, LastSyncDateTime, ComplianceState, UserPrincipalName | Format-List
    
    # Optional: Export full details to JSON
    # $Device | ConvertTo-Json -Depth 5 | Out-File "$DeviceName-Details.json"
} else {
    Write-Warning "Device '$DeviceName' not found."
}
