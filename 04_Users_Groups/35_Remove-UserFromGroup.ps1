<#
.SYNOPSIS
    Entfernt einen Benutzer aus einer Gruppe.
    
.DESCRIPTION
    Löscht die Mitgliedschaft eines Benutzers in einer Gruppe.
    Erfordert die Berechtigung 'GroupMember.ReadWrite.All'.

.NOTES
    File Name: 35_Remove-UserFromGroup.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [Parameter(Mandatory=$true)]
    [string]$GroupId,

    [Parameter(Mandatory=$true)]
    [string]$UserPrincipalName
)

Connect-MgGraph -Scopes "GroupMember.ReadWrite.All"

$User = Get-MgUser -UserId $UserPrincipalName
if (!$User) { Write-Warning "Benutzer nicht gefunden"; exit }

try {
    Remove-MgGroupMemberByRef -GroupId $GroupId -DirectoryObjectId $User.Id
    Write-Host "Benutzer entfernt." -ForegroundColor Green
} catch {
    Write-Error "Fehler beim Entfernen: $_"
}
