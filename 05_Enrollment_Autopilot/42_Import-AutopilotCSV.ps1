<#
.SYNOPSIS
    Imports Windows Autopilot Devices from CSV.
    
.DESCRIPTION
    CSV Format: SerialNumber,WindowsProductID,HardwareHash,GroupTag
    Requires 'DeviceManagementServiceConfig.ReadWrite.All' permission.

.NOTES
    File Name: 42_Import-AutopilotCSV.ps1
    Author: Kaffee & Code Assistant
    Version: 1.0
#>

param(
    [Parameter(Mandatory=$true)]
    [string]$CsvPath
)

Connect-MgGraph -Scopes "DeviceManagementServiceConfig.ReadWrite.All"

$Records = Import-Csv $CsvPath

foreach ($Row in $Records) {
    $Params = @{
        serialNumber = $Row.SerialNumber
        productKey = $Row.WindowsProductID
        hardwareIdentifier = $Row.HardwareHash
        groupTag = $Row.GroupTag
    }
    
    try {
        New-MgDeviceManagementWindowsAutopilotDeviceIdentity -BodyParameter $Params
        Write-Host "Imported: $($Row.SerialNumber)" -ForegroundColor Green
    } catch {
        Write-Error "Failed to import $($Row.SerialNumber): $_"
    }
}
