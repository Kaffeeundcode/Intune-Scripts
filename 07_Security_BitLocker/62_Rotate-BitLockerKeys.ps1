<#
.SYNOPSIS
    Triggered eine Rotation des BitLocker-Schlüssels.
    
.DESCRIPTION
    Fordert das Gerät auf, einen neuen Recovery Key zu generieren und hochzuladen.
    Erfordert die Berechtigung 'DeviceManagementManagedDevices.ReadWrite.All'.

.NOTES
    File Name: 62_Rotate-BitLockerKeys.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [Parameter(Mandatory=$true)]
    [string]$DeviceName
)

Connect-MgGraph -Scopes "DeviceManagementManagedDevices.ReadWrite.All"

$Device = Get-MgDeviceManagementManagedDevice -Filter "deviceName eq '$DeviceName'"

if ($Device) {
    Invoke-MgRotateDeviceManagementManagedDeviceBitLockerKey -ManagedDeviceId $Device.Id
    Write-Host "Rotation angefordert für: $($Device.DeviceName)" -ForegroundColor Green
} else {
    Write-Warning "Gerät nicht gefunden."
}
