<#
.SYNOPSIS
    Assigns a Configuration Profile to a Group.
    
.DESCRIPTION
    Assignments for profiles usually just target a group.
    Requires 'DeviceManagementConfiguration.ReadWrite.All' permission.

.NOTES
    File Name: 26_Assign-ConfigProfile.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param(
    [Parameter(Mandatory=$true)]
    [string]$ProfileName,

    [Parameter(Mandatory=$true)]
    [string]$GroupId
)

Connect-MgGraph -Scopes "DeviceManagementConfiguration.ReadWrite.All"

$Profile = Get-MgDeviceManagementDeviceConfiguration -Filter "displayName eq '$ProfileName'"
if ($Profile -is [array]) { $Profile = $Profile[0] }
if (-not $Profile) { Write-Error "Profile not found"; exit }

# Assignment Body
$Params = @{
    "@odata.type" = "#microsoft.graph.deviceConfigurationAssignment"
    target = @{
        "@odata.type" = "#microsoft.graph.groupAssignmentTarget"
        groupId = $GroupId
    }
}

try {
    New-MgDeviceManagementDeviceConfigurationAssignment -DeviceConfigurationId $Profile.Id -BodyParameter $Params
    Write-Host "Assigned Profile '$ProfileName' to Group '$GroupId'." -ForegroundColor Green
} catch {
    Write-Error "Assignment failed: $_"
}
