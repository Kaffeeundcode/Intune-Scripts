<#
.SYNOPSIS
    Adds a User to a Security Group.
    
.DESCRIPTION
    Requires 'GroupMember.ReadWrite.All' permission.

.NOTES
    File Name: 34_Add-UserToGroup.ps1
    Author: Kaffee & Code Assistant
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
    New-MgGroupMember -GroupId $GroupId -DirectoryObjectId $User.Id
    Write-Host "User '$UserPrincipalName' added to Group '$GroupId'." -ForegroundColor Green
} catch {
    Write-Error "Failed to add user: $_"
}
