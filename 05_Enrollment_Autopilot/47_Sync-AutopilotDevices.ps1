<#
.SYNOPSIS
    Triggered eine Synchronisierung der Autopilot-Geräte (Store/Partner).
    
.DESCRIPTION
    Stößt den Sync-Prozess an, um neue Geräte aus dem Microsoft Store for Business oder von Partnern zu laden.
    Erfordert die Berechtigung 'DeviceManagementServiceConfig.ReadWrite.All'.

.NOTES
    File Name: 47_Sync-AutopilotDevices.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param()

Connect-MgGraph -Scopes "DeviceManagementServiceConfig.ReadWrite.All"

Invoke-MgSyncDeviceManagementWindowsAutopilotDeviceIdentity
Write-Host "Autopilot Sync gestartet." -ForegroundColor Green
