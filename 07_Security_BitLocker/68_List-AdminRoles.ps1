<#
.SYNOPSIS
    Lists Intune Admin Roles (RBAC).
    
.DESCRIPTION
    Requires 'DeviceManagementRBAC.Read.All' permission.

.NOTES
    File Name: 68_List-AdminRoles.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param()

Connect-MgGraph -Scopes "DeviceManagementRBAC.Read.All"

$Roles = Get-MgDeviceManagementRoleDefinition -All

if ($Roles) {
    $Roles | Select-Object DisplayName, IsBuiltIn, Id | Format-Table
}
