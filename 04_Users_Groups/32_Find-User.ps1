<#
.SYNOPSIS
    Findet einen Benutzer anhand des Namens oder UPN.
    
.DESCRIPTION
    Sucht nach Benutzern, deren Name oder UPN mit dem Suchbegriff beginnt.
    Erfordert die Berechtigung 'User.Read.All'.

.NOTES
    File Name: 32_Find-User.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [Parameter(Mandatory=$true)]
    [string]$SearchTerm
)

Connect-MgGraph -Scopes "User.Read.All"

$Users = Get-MgUser -Filter "startswith(displayName, '$SearchTerm') or startswith(userPrincipalName, '$SearchTerm')"

if ($Users) {
    $Users | Select-Object DisplayName, UserPrincipalName, Id
} else {
    Write-Warning "Kein Benutzer gefunden."
}
