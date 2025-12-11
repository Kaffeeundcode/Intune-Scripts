<#
.SYNOPSIS
    Triggers Defender Full Scan.
    
.DESCRIPTION
    Requires 'DeviceManagementManagedDevices.ReadWrite.All' permission.

.NOTES
    File Name: 66_FullScan-Defender.ps1
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
    # quick=false
    Invoke-MgDeviceManagementManagedDeviceWindowsDefenderScan -ManagedDeviceId $Device.Id -QuickScan $false
    Write-Host "FULL Scan initiated on $($Device.DeviceName)." -ForegroundColor Green
}
