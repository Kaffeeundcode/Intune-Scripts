<#
.SYNOPSIS
    Startet einen Defender Quick Scan.
    
.DESCRIPTION
    Remote Action für einen schnellen Virenscan.
    Erfordert die Berechtigung 'DeviceManagementManagedDevices.ReadWrite.All'.

.NOTES
    File Name: 65_QuickScan-Defender.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [string]$DeviceName
)

Connect-MgGraph -Scopes "DeviceManagementManagedDevices.ReadWrite.All"

$Device = Get-MgDeviceManagementManagedDevice -Filter "deviceName eq '$DeviceName'"
if ($Device) {
    Invoke-MgWindowsDefenderScanDeviceManagementManagedDevice -ManagedDeviceId $Device.Id -QuickScan $true
    Write-Host "Quick Scan gestartet." -ForegroundColor Green
}
