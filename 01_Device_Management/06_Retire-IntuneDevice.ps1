<#
.SYNOPSIS
    Entfernt Unternehmensdaten von einem Gerät (Retire).
    
.DESCRIPTION
    Führt eine 'Retire'-Aktion (Ausmustern) durch. Dabei werden nur Managed Apps und Unternehmensdaten entfernt.
    Das Gerät wird aus der Intune-Verwaltung entfernt, private Daten bleiben erhalten.
    Erfordert die Berechtigung 'DeviceManagementManagedDevices.ReadWrite.All'.

.NOTES
    File Name: 06_Retire-IntuneDevice.ps1
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
    Retire-MgDeviceManagementManagedDevice -ManagedDeviceId $Device.Id
    Write-Host "Retire-Befehl gesendet an: $($Device.DeviceName)" -ForegroundColor Green
} else {
    Write-Warning "Gerät nicht gefunden."
}
