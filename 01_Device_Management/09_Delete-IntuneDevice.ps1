<#
.SYNOPSIS
    Löscht das Geräteobjekt aus Intune.
    
.DESCRIPTION
    Entfernt den Geräteeintrag aus der Intune-Konsole.
    Dies führt KEINEN Wipe durch, sondern löscht nur den Datensatz (z.B. für "Karteileichen").
    Erfordert die Berechtigung 'DeviceManagementManagedDevices.ReadWrite.All'.

.NOTES
    File Name: 09_Delete-IntuneDevice.ps1
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
    Remove-MgDeviceManagementManagedDevice -ManagedDeviceId $Device.Id -Confirm:$false
    Write-Host "Gerät wurde aus Intune gelöscht: $($Device.DeviceName)" -ForegroundColor Green
} else {
    Write-Warning "Gerät nicht gefunden."
}
