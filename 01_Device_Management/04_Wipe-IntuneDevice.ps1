<#
.SYNOPSIS
    Setzt ein Gerät auf Werkseinstellungen zurück (Wipe).
    
.DESCRIPTION
    Führt einen vollständigen Wipe (Zurücksetzen) des Geräts durch.
    WARNUNG: Alle Daten auf dem Gerät werden gelöscht!
    Erfordert die Berechtigung 'DeviceManagementManagedDevices.ReadWrite.All'.

.NOTES
    File Name: 04_Wipe-IntuneDevice.ps1
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
    # Full Wipe
    Wipe-MgDeviceManagementManagedDevice -ManagedDeviceId $Device.Id -KeepEnrollmentData:$false -KeepUserData:$false
    Write-Warning "WIPE-Befehl gesendet an: $($Device.DeviceName). Alle Daten werden gelöscht!"
} else {
    Write-Warning "Gerät nicht gefunden."
}
