<#
.SYNOPSIS
    Triggers Defender Quick Scan.
    
.DESCRIPTION
    Requires 'DeviceManagementManagedDevices.ReadWrite.All' permission.

.NOTES
    File Name: 65_QuickScan-Defender.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param(
    [Parameter(Mandatory=$true)]
    [string]$DeviceName
)

Connect-MgGraph -Scopes "DeviceManagementManagedDevices.ReadWrite.All"

$Device = Get-MgDeviceManagementManagedDevice -Filter "deviceName eq '$DeviceName'"

if ($Device) {
    # quick=true
    Invoke-MgDeviceManagementManagedDeviceWindowsDefenderScan -ManagedDeviceId $Device.Id -QuickScan $true
    Write-Host "Quick Scan initiated on $($Device.DeviceName)." -ForegroundColor Green
}
