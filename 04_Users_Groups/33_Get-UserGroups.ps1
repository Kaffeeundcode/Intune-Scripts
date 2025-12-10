<#
.SYNOPSIS
    Gets Group Memberships for a User.
    
.DESCRIPTION
    Lists all Azure AD Groups the user is a member of.
    Requires 'User.Read.All', 'GroupMember.Read.All' permission.

.NOTES
    File Name: 33_Get-UserGroups.ps1
    Author: Kaffee & Code Assistant
    Version: 1.0
#>

param(
    [Parameter(Mandatory=$true)]
    [string]$UserPrincipalName
)

Connect-MgGraph -Scopes "User.Read.All", "GroupMember.Read.All"

$User = Get-MgUser -UserId $UserPrincipalName
if (-not $User) { Write-Error "User not found"; exit }

$Groups = Get-MgUserMemberOf -UserId $User.Id

if ($Groups) {
    # Note: MemberOf can include directoryRoles, so we filter/select carefully
    $Groups | Select-Object Id, @{N='Name';E={$_.AdditionalProperties['displayName']}}, @{N='Type';E={$_.AdditionalProperties['@odata.type']}} | Format-Table
} else {
    Write-Host "User is not in any groups."
}
