<#
.SYNOPSIS
    Gets details of a Group.
    
.DESCRIPTION
    Requires 'Group.Read.All' permission.

.NOTES
    File Name: 40_Get-GroupDetails.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param(
    [Parameter(Mandatory=$true)]
    [string]$GroupId
)

Connect-MgGraph -Scopes "Group.Read.All"

$Group = Get-MgGroup -GroupId $GroupId
if ($Group) {
    $Group | Select-Object DisplayName, Id, Description, GroupTypes, MailEnabled, SecurityEnabled | Format-List
} else {
    Write-Warning "Group not found."
}
