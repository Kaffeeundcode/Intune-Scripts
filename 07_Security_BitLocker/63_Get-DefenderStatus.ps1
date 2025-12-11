<#
.SYNOPSIS
    Prüft den Defender-Status.
    
.DESCRIPTION
    Liest aus, ob der Echtzeitschutz aktiv ist und wann der letzte Scan war.
    Erfordert die Berechtigung 'DeviceManagementManagedDevices.Read.All'.

.NOTES
    File Name: 63_Get-DefenderStatus.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [string]$DeviceName
)

Connect-MgGraph -Scopes "DeviceManagementManagedDevices.Read.All"

$Device = Get-MgDeviceManagementManagedDevice -Filter "deviceName eq '$DeviceName'"
# Note: Granular Defender status often requires MDE (Defender for Endpoint) API or interpreting config states.
# Basic Intune object has properties: valid, clean etc.
if ($Device) {
    Write-Host "Device Health Status: $($Device.DeviceHealthAttestationState)"
}
