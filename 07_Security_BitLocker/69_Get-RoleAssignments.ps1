<#
.SYNOPSIS
    Gets Role Assignments (Who has RBAC permissions).
    
.DESCRIPTION
    Requires 'DeviceManagementRBAC.Read.All' permission.

.NOTES
    File Name: 69_Get-RoleAssignments.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param(
    [string]$RoleName
)

Connect-MgGraph -Scopes "DeviceManagementRBAC.Read.All"

if ($RoleName) {
    $Role = Get-MgDeviceManagementRoleDefinition -Filter "displayName eq '$RoleName'"
    if ($Role) {
        $Assigns = Get-MgDeviceManagementRoleDefinitionRoleAssignment -RoleDefinitionId $Role.Id
        $Assigns | Select-Object DisplayName, Description, Members | Format-List
    }
} else {
    # List all assignments
    Write-Host "Listing all Role Assignments requires ID loop. Please provide -RoleName to check specific role."
}
