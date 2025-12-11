<#
.SYNOPSIS
    Startet ein verwaltetes Gerät neu (Remote Action).
    
.DESCRIPTION
    Sendet einen Neustart-Befehl an das angegebene Gerät.
    Hinweis: Funktioniert nur bei Windows/macOS/iOS Geräten, die diese Remote-Aktion unterstützen.
    Erfordert die Berechtigung 'DeviceManagementManagedDevices.ReadWrite.All'.

.NOTES
    File Name: 02_Restart-IntuneDevice.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [Parameter(Mandatory=$true)]
    [string]$DeviceName
)

Connect-MgGraph -Scopes "DeviceManagementManagedDevices.ReadWrite.All"

$Device = Get-MgDeviceManagementManagedDevice -Filter "deviceName eq '$DeviceName'" -ErrorAction SilentlyContinue

if ($Device) {
    Restart-MgDeviceManagementManagedDevice -ManagedDeviceId $Device.Id
    Write-Host "Neustart-Befehl gesendet an: $($Device.DeviceName)" -ForegroundColor Green
} else {
    Write-Warning "Gerät nicht gefunden."
}
