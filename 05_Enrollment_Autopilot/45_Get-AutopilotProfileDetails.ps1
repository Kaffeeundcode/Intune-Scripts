<#
.SYNOPSIS
    Gets details of an Autopilot Profile.
    
.DESCRIPTION
    Requires 'DeviceManagementServiceConfig.Read.All' permission.

.NOTES
    File Name: 45_Get-AutopilotProfileDetails.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param(
    [Parameter(Mandatory=$true)]
    [string]$ProfileName
)

Connect-MgGraph -Scopes "DeviceManagementServiceConfig.Read.All"

$Profile = Get-MgDeviceManagementWindowsAutopilotDeploymentProfile -Filter "displayName eq '$ProfileName'"

if ($Profile) {
    $Profile | Select-Object DisplayName, Description, Language, ExtractHardwareHash | Format-List
    Write-Host "OOBE Settings:"
    $Profile.OutOfBoxExperienceSettings | Format-List
} else {
    Write-Warning "Profile not found."
}
