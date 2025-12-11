<#
.SYNOPSIS
    Gets BitLocker/Encryption status report.
    
.DESCRIPTION
    Requires 'DeviceManagementManagedDevices.Read.All' permission.

.NOTES
    File Name: 56_Get-DeviceEncryptionStatus.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param()

Connect-MgGraph -Scopes "DeviceManagementManagedDevices.Read.All"

$Devices = Get-MgDeviceManagementManagedDevice -All

if ($Devices) {
    # Check encryption state property (Graph property name varies by version, usually 'complianceState' implies policy but 'isEncrypted' is explicit)
    $Devices | Select-Object DeviceName, UserPrincipalName, IsEncrypted, OperatingSystem | Format-Table
} else {
    Write-Warning "No devices found."
}
