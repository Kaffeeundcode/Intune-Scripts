<#
.SYNOPSIS
    Fügt einen Owner zu einer Gruppe hinzu.
    
.DESCRIPTION
    Macht einen User zum Besitzer einer Gruppe.
    Erfordert die Berechtigung 'Group.ReadWrite.All'.

.NOTES
    File Name: 115_Set-GroupOwner.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [string]$GroupName,
    [string]$OwnerUPN
)

Connect-MgGraph -Scopes "Group.ReadWrite.All"

$Group = Get-MgGroup -Filter "displayName eq '$GroupName'"
$User = Get-MgUser -UserId $OwnerUPN

if ($Group -and $User) {
    New-MgGroupOwnerByRef -GroupId $Group.Id -DirectoryObjectId $User.Id
    Write-Host "Owner hinzugefügt."
}
