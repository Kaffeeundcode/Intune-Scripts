<#
.SYNOPSIS
    Removes a User from a Security Group.
    
.DESCRIPTION
    Requires 'GroupMember.ReadWrite.All' permission.

.NOTES
    File Name: 35_Remove-UserFromGroup.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param(
    [Parameter(Mandatory=$true)]
    [string]$UserPrincipalName,

    [Parameter(Mandatory=$true)]
    [string]$GroupId
)

Connect-MgGraph -Scopes "GroupMember.ReadWrite.All", "User.Read.All"

$User = Get-MgUser -UserId $UserPrincipalName
if (-not $User) { Write-Error "User not found"; exit }

try {
    Remove-MgGroupMemberByRef -GroupId $GroupId -DirectoryObjectId $User.Id
    Write-Host "User '$UserPrincipalName' removed from Group '$GroupId'." -ForegroundColor Green
} catch {
    Write-Error "Failed to remove user: $_"
}
