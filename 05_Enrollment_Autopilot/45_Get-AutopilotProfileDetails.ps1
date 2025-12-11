<#
.SYNOPSIS
    Ruft Details zu einem Autopilot Profil ab.
    
.DESCRIPTION
    Zeigt Einstellungen wie OOBE-Verhalten, Admin-Rechte etc. eines Profils.
    Erfordert die Berechtigung 'DeviceManagementServiceConfig.Read.All'.

.NOTES
    File Name: 45_Get-AutopilotProfileDetails.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [string]$ProfileName
)

Connect-MgGraph -Scopes "DeviceManagementServiceConfig.Read.All"

$Profiles = Get-MgDeviceManagementWindowsAutopilotDeploymentProfile -All
if ($ProfileName) {
    $Profiles = $Profiles | Where-Object {$_.DisplayName -match $ProfileName}
}

$Profiles | Select-Object DisplayName, Description, CreatedDateTime, LastModifiedDateTime
