<#
.SYNOPSIS
    Sperrt ein Gerät remote.
    
.DESCRIPTION
    Sendet 'Remote Lock' Befehl.
    Erfordert die Berechtigung 'DeviceManagementManagedDevices.ReadWrite.All'.

.NOTES
    File Name: 73_RemoteLock-Device.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [string]$DeviceName
)

Connect-MgGraph -Scopes "DeviceManagementManagedDevices.ReadWrite.All"

$Device = Get-MgDeviceManagementManagedDevice -Filter "deviceName eq '$DeviceName'"
if ($Device) {
    Invoke-MgRemoteLockDeviceManagementManagedDevice -ManagedDeviceId $Device.Id
    Write-Host "Gerät gesperrt." -ForegroundColor Green
}
