<#
.SYNOPSIS
    Fügt einen Benutzer einer Gruppe hinzu.
    
.DESCRIPTION
    Nimmt einen Benutzer in eine (Sicherheits-)Gruppe auf.
    Erfordert die Berechtigung 'GroupMember.ReadWrite.All'.

.NOTES
    File Name: 34_Add-UserToGroup.ps1
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
    New-MgGroupMember -GroupId $GroupId -DirectoryObjectId $User.Id
    Write-Host "Benutzer hinzugefügt." -ForegroundColor Green
} catch {
    Write-Error "Fehler beim Hinzufügen: $_"
}
