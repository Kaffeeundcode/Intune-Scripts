<#
.SYNOPSIS
    Zeigt die Besitzer (Owners) einer Gruppe.
    
.DESCRIPTION
    Listet User auf, die Owner-Rechte an der Gruppe haben.
    Erfordert die Berechtigung 'Group.Read.All'.

.NOTES
    File Name: 114_Get-GroupOwners.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [string]$GroupName
)

Connect-MgGraph -Scopes "Group.Read.All"

$Group = Get-MgGroup -Filter "displayName eq '$GroupName'"
if ($Group) {
    Get-MgGroupOwner -GroupId $Group.Id | Select-Object Id, @{N='Name';E={$_.AdditionalProperties.displayName}}, @{N='UPN';E={$_.AdditionalProperties.userPrincipalName}}
}
