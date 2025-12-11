<#
.SYNOPSIS
    Zeigt den Status von Konfigurationsprofilen auf einem Gerät.
    
.DESCRIPTION
    Analysiert, welche Config-Profile erfolgreich angewendet wurden oder Fehler melden.
    Erfordert die Berechtigung 'DeviceManagementConfiguration.Read.All'.

.NOTES
    File Name: 28_Get-DeviceConfigStatus.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [Parameter(Mandatory=$true)]
    [string]$DeviceName
)

Connect-MgGraph -Scopes "DeviceManagementConfiguration.Read.All", "DeviceManagementManagedDevices.Read.All"

$Device = Get-MgDeviceManagementManagedDevice -Filter "deviceName eq '$DeviceName'"
if (!$Device) { Write-Warning "Gerät nicht gefunden"; exit }

$States = Get-MgDeviceManagementManagedDeviceDeviceConfigurationState -ManagedDeviceId $Device.Id

$States | Select-Object DisplayName, State, SettingCount | Format-Table -AutoSize
