<#
.SYNOPSIS
    Listet Mitglieder einer Gruppe auf.
    
.DESCRIPTION
    Zeigt alle Benutzer (und Geräte), die Mitglied einer spezifischen Gruppe sind.
    Erfordert die Berechtigung 'GroupMember.Read.All'.

.NOTES
    File Name: 36_Get-GroupMembers.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [Parameter(Mandatory=$true)]
    [string]$GroupId
)

Connect-MgGraph -Scopes "GroupMember.Read.All"

$Members = Get-MgGroupMember -GroupId $GroupId -All
Write-Host "Anzahl Mitglieder: $($Members.Count)"

# Output IDs commonly, as names require extra fetches or casting
$Members | Select-Object Id, @{N='Type';E={$_.ObjektType}}
