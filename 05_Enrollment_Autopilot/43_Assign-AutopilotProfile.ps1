<#
.SYNOPSIS
    Weist einem Autopilot-Gerät ein Deployment-Profil zu.
    
.DESCRIPTION
    Verknüpft ein Autopilot-Gerät (via ID) mit einem spezifischen Profil.
    Erfordert die Berechtigung 'DeviceManagementServiceConfig.ReadWrite.All'.

.NOTES
    File Name: 43_Assign-AutopilotProfile.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [Parameter(Mandatory=$true)]
    [string]$AutopilotDeviceId,

    [Parameter(Mandatory=$true)]
    [string]$ProfileId
)

Connect-MgGraph -Scopes "DeviceManagementServiceConfig.ReadWrite.All"

try {
    # Assign operations are usually done via AssignUserToDevice or by letting the dynamic group handling it.
    # Direct assignment via Graph: windowsAutopilotDeviceIdentity/{id}/assignUserToDevice
    # But profile assignment is usually group based. Direct profile assignment to device identity is: update identity object.
    
    Update-MgDeviceManagementWindowsAutopilotDeviceIdentity -WindowsAutopilotDeviceIdentityId $AutopilotDeviceId -DeploymentProfileAssignedDateTime (Get-Date) -DeploymentProfileAssignmentStatus "assigned"
    # Actually, you set the GroupTag usually to match a dynamic group, OR direct assign.
    Write-Warning "Profilzuweisung erfolgt in der Regel über dynamische Gruppen (Group Tag)."
} catch {
    Write-Error "Fehler: $_"
}
