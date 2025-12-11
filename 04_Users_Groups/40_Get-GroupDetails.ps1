<#
.SYNOPSIS
    Ruft Details zu einer Gruppe ab (ID, Typ etc.).
    
.DESCRIPTION
    Zeigt Eigenschaften einer Gruppe anhand des Namens an.
    Erfordert die Berechtigung 'Group.Read.All'.

.NOTES
    File Name: 40_Get-GroupDetails.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [Parameter(Mandatory=$true)]
    [string]$GroupName
)

Connect-MgGraph -Scopes "Group.Read.All"

$Group = Get-MgGroup -Filter "displayName eq '$GroupName'"
if ($Group) {
    $Group | Select-Object DisplayName, Id, Description, GroupTypes, Visibility
} else {
    Write-Warning "Gruppe nicht gefunden."
}
