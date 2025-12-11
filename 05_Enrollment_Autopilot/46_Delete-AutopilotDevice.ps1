<#
.SYNOPSIS
    Löscht ein Autopilot-Gerät (Hash).
    
.DESCRIPTION
    Entfernt den Hardware-Hash aus dem Autopilot-Service. Notwendig vor Board-Swap oder Verkauf.
    Erfordert die Berechtigung 'DeviceManagementServiceConfig.ReadWrite.All'.

.NOTES
    File Name: 46_Delete-AutopilotDevice.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [Parameter(Mandatory=$true)]
    [string]$SerialNumber
)

Connect-MgGraph -Scopes "DeviceManagementServiceConfig.ReadWrite.All"

$Dev = Get-MgDeviceManagementWindowsAutopilotDeviceIdentity -Filter "serialNumber eq '$SerialNumber'"
if ($Dev) {
    Remove-MgDeviceManagementWindowsAutopilotDeviceIdentity -WindowsAutopilotDeviceIdentityId $Dev.Id
    Write-Host "Autopilot-Gerät gelöscht: $SerialNumber" -ForegroundColor Green
} else {
    Write-Warning "Gerät nicht gefunden (Check Serial)."
}
