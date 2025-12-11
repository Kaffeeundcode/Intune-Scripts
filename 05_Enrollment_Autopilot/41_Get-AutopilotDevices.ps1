<#
.SYNOPSIS
    Listet alle Windows Autopilot Geräte auf.
    
.DESCRIPTION
    Ruft registrierte Autopilot-Devices ab (Serial Number, Model, Profile Status).
    Erfordert die Berechtigung 'DeviceManagementServiceConfig.Read.All'.

.NOTES
    File Name: 41_Get-AutopilotDevices.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param()

Connect-MgGraph -Scopes "DeviceManagementServiceConfig.Read.All"

Write-Host "Lade Autopilot Geräte..."
$Devices = Get-MgDeviceManagementWindowsAutopilotDeviceIdentity -All

Write-Host "Gefunden: $($Devices.Count)" -ForegroundColor Cyan
$Devices | Select-Object SerialNumber, ProductKey, Model, DeploymentProfileAssignmentStatus, DeploymentProfileDisplayName | Format-Table -AutoSize
