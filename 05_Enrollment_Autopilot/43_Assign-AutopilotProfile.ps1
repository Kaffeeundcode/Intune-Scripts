<#
.SYNOPSIS
    Assigns an Autopilot Profile to a Device.
    
.DESCRIPTION
    Associates an Autopilot Device Identity with a Deployment Profile.
    Requires 'DeviceManagementServiceConfig.ReadWrite.All' permission.

.NOTES
    File Name: 43_Assign-AutopilotProfile.ps1
    Author: Kaffee & Code Assistant
    Version: 1.0
#>

param(
    [Parameter(Mandatory=$true)]
    [string]$SerialNumber,

    [Parameter(Mandatory=$true)]
    [string]$ProfileName
)

Connect-MgGraph -Scopes "DeviceManagementServiceConfig.ReadWrite.All"

# Find Device
$Device = Get-MgDeviceManagementWindowsAutopilotDeviceIdentity -Filter "serialNumber eq '$SerialNumber'"
if (-not $Device) { Write-Error "Device with Serial '$SerialNumber' not found."; exit }

# Find Profile
$Profile = Get-MgDeviceManagementWindowsAutopilotDeploymentProfile -Filter "displayName eq '$ProfileName'"
if (-not $Profile) { Write-Error "Profile '$ProfileName' not found."; exit }

# Assign
try {
    Assign-MgDeviceManagementWindowsAutopilotDeploymentProfileToDevice -WindowsAutopilotDeploymentProfileId $Profile.Id -WindowsAutopilotDeviceIdentities @($Device.Id)
    Write-Host "Profile '$ProfileName' assigned to '$SerialNumber'." -ForegroundColor Green
} catch {
    Write-Error "Assignment failed: $_"
}
