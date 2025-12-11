<#
.SYNOPSIS
    Listet Gruppenmitgliedschaften eines Benutzers auf.
    
.DESCRIPTION
    Zeigt alle Gruppen an, in denen der angegebene Benutzer Mitglied ist.
    Erfordert die Berechtigung 'User.Read.All'.

.NOTES
    File Name: 33_Get-UserGroups.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [Parameter(Mandatory=$true)]
    [string]$UserPrincipalName
)

Connect-MgGraph -Scopes "User.Read.All"

$User = Get-MgUser -UserId $UserPrincipalName
if (!$User) { Write-Warning "Benutzer nicht gefunden"; exit }

$Groups = Get-MgUserMemberOf -UserId $User.Id
Write-Host "Gruppen für $($User.DisplayName):"
foreach ($Group in $Groups) {
    # Note: MemberOf returns directory objects, casting usually handled by output
    Write-Host " - $($Group.Id)" 
    # To get DisplayName usually needs parsing or different cmd let depending on SDK version
}
