<#
.SYNOPSIS
    Prüft den Enrollment-Status eines bestimmten Geräts.
    
.DESCRIPTION
    Validiert, ob ein Gerät sauber enrolled wurde oder im Fehlerstatus steht.
    Erfordert die Berechtigung 'DeviceManagementManagedDevices.Read.All'.

.NOTES
    File Name: 50_Check-EnrollmentStatus.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [string]$DeviceName
)

Connect-MgGraph -Scopes "DeviceManagementManagedDevices.Read.All"

$Device = Get-MgDeviceManagementManagedDevice -Filter "deviceName eq '$DeviceName'"
if ($Device) {
    Write-Host "Device: $($Device.DeviceName)"
    Write-Host "Enrollment Type: $($Device.ManagementAgent)"
    Write-Host "Config Mgr: $($Device.IsManagedBy)"
}
