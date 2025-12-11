<#
.SYNOPSIS
    Syncs Windows Autopilot Devices.
    
.DESCRIPTION
    Triggers a sync between Intune and the Autopilot service to update device states.
    Requires 'DeviceManagementServiceConfig.ReadWrite.All' permission.

.NOTES
    File Name: 47_Sync-AutopilotDevices.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param()

Connect-MgGraph -Scopes "DeviceManagementServiceConfig.ReadWrite.All"

Write-Host "Triggering Autopilot Sync..."
Invoke-MgSyncDeviceManagementWindowsAutopilotDeviceIdentity
Write-Host "Sync initiated. Check Intune console for status." -ForegroundColor Green
