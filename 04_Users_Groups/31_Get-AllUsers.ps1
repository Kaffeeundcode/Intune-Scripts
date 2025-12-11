<#
.SYNOPSIS
    Lists all Azure AD Users.
    
.DESCRIPTION
    Retrieves a list of users from Azure Active Directory / Intune.
    Requires 'User.Read.All' permission.

.NOTES
    File Name: 31_Get-AllUsers.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param()

Connect-MgGraph -Scopes "User.Read.All"

$Users = Get-MgUser -All

if ($Users) {
    $Users | Select-Object DisplayName, UserPrincipalName, Id, AccountEnabled | Format-Table -AutoSize
    Write-Host "Total Users: $($Users.Count)" -ForegroundColor Green
} else {
    Write-Warning "No users found."
}
