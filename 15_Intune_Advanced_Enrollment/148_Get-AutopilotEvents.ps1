<#
.SYNOPSIS
    Listet Autopilot Events auf.
    
.DESCRIPTION
    Zeigt Events im Zusammenhang mit Autopilot Deployments.
    Erfordert die Berechtigung 'DeviceManagementServiceConfig.Read.All'.

.NOTES
    File Name: 148_Get-AutopilotEvents.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param()

Get-MgDeviceManagementWindowsAutopilotDeviceIdentity | Select-Object -First 10 | ForEach-Object {
    Get-MgDeviceManagementWindowsAutopilotDeviceIdentityDeploymentProfile -WindowsAutopilotDeviceIdentityId $_.Id
}
