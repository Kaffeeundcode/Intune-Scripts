<#
.SYNOPSIS
    Benennt ein Intune-Gerät um.
    
.DESCRIPTION
    Ändert den Gerätenamen in Intune und auf dem Gerät selbst (sofern unterstützt).
    Dies erfordert einen Neustart des Geräts, um vollständig wirksam zu werden.
    Erfordert die Berechtigung 'DeviceManagementManagedDevices.ReadWrite.All'.

.NOTES
    File Name: 03_Rename-IntuneDevice.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [Parameter(Mandatory=$true)]
    [string]$CurrentName,

    [Parameter(Mandatory=$true)]
    [string]$NewName
)

Connect-MgGraph -Scopes "DeviceManagementManagedDevices.ReadWrite.All"

$Device = Get-MgDeviceManagementManagedDevice -Filter "deviceName eq '$CurrentName'" -ErrorAction SilentlyContinue

if ($Device) {
    Set-MgDeviceManagementManagedDeviceName -ManagedDeviceId $Device.Id -DeviceName $NewName
    Write-Host "Umbenennung angefordert für $($Device.DeviceName) -> $NewName" -ForegroundColor Green
} else {
    Write-Warning "Gerät '$CurrentName' nicht gefunden."
}
