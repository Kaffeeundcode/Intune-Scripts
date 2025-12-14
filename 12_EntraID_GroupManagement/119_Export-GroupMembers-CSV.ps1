<#
.SYNOPSIS
    Exportiert Gruppenmitglieder in CSV.
    
.DESCRIPTION
    Liest alle Member und speichert sie.
    Erfordert die Berechtigung 'GroupMember.Read.All'.

.NOTES
    File Name: 119_Export-GroupMembers-CSV.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [string]$GroupName,
    [string]$Path = "$HOME/Desktop/GroupMembers.csv"
)

Connect-MgGraph -Scopes "GroupMember.Read.All"

$Group = Get-MgGroup -Filter "displayName eq '$GroupName'"
if ($Group) {
    $Members = Get-MgGroupMember -GroupId $Group.Id -All
    $Members | Select-Object Id, @{N='UPN';E={$_.AdditionalProperties.userPrincipalName}} | Export-Csv -Path $Path -NoTypeInformation
    Write-Host "Export fertig: $Path"
}
