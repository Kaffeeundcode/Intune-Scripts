<#
.SYNOPSIS
    Finds a User by Name or UPN.
    
.DESCRIPTION
    Searches for users containing the specified string.
    Requires 'User.Read.All' permission.

.NOTES
    File Name: 32_Find-User.ps1
    Author: Kaffee & Code Assistant
    Version: 1.0
#>

param(
    [Parameter(Mandatory=$true)]
    [string]$SearchTerm
)

Connect-MgGraph -Scopes "User.Read.All"

$Users = Get-MgUser -Filter "startsWith(userPrincipalName, '$SearchTerm') or startsWith(displayName, '$SearchTerm')"

if ($Users) {
    $Users | Select-Object DisplayName, UserPrincipalName, Id, JobTitle, Department | Format-Table
} else {
    Write-Host "No users found matching '$SearchTerm'."
}
