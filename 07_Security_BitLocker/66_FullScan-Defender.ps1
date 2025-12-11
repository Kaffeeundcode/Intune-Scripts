<#
.SYNOPSIS
    Startet einen Defender Full Scan.
    
.DESCRIPTION
    Remote Action für einen vollständigen Systemscan.
    Erfordert die Berechtigung 'DeviceManagementManagedDevices.ReadWrite.All'.

.NOTES
    File Name: 66_FullScan-Defender.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [string]$DeviceName
)

Connect-MgGraph -Scopes "DeviceManagementManagedDevices.ReadWrite.All"

$Device = Get-MgDeviceManagementManagedDevice -Filter "deviceName eq '$DeviceName'"
if ($Device) {
    Invoke-MgWindowsDefenderScanDeviceManagementManagedDevice -ManagedDeviceId $Device.Id -QuickScan $false
    Write-Host "Full Scan gestartet." -ForegroundColor Green
}
