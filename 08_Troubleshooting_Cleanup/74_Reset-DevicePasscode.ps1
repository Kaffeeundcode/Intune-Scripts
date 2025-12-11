<#
.SYNOPSIS
    Entfernt/Setzt den Passcode zurück (iOS/Android).
    
.DESCRIPTION
    Löscht den Geräte-Passcode (nicht User-Passwort!), damit User wieder Zugriff haben.
    Erfordert die Berechtigung 'DeviceManagementManagedDevices.ReadWrite.All'.

.NOTES
    File Name: 74_Reset-DevicePasscode.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [string]$DeviceName
)

Connect-MgGraph -Scopes "DeviceManagementManagedDevices.ReadWrite.All"

$Device = Get-MgDeviceManagementManagedDevice -Filter "deviceName eq '$DeviceName'"
if ($Device) {
    Invoke-MgResetPasscodeDeviceManagementManagedDevice -ManagedDeviceId $Device.Id
    Write-Host "Passcode Reset angefordert." -ForegroundColor Yellow
}
