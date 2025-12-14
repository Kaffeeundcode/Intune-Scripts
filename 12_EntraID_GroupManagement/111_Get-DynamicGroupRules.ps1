<#
.SYNOPSIS
    Zeigt die Regeln einer dynamischen Gruppe an.
    
.DESCRIPTION
    Liest die "membershipRule" Property von dynamischen AAD-Gruppen aus.
    Erfordert die Berechtigung 'Group.Read.All'.

.NOTES
    File Name: 111_Get-DynamicGroupRules.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [Parameter(Mandatory=$true)]
    [string]$GroupName
)

Connect-MgGraph -Scopes "Group.Read.All"

$Group = Get-MgGroup -Filter "displayName eq '$GroupName'" -Property Id, DisplayName, GroupTypes, MembershipRule, MembershipRuleProcessingState

if ($Group -and $Group.GroupTypes -contains "DynamicMembership") {
    Write-Host "Regel für '$GroupName':" -ForegroundColor Cyan
    Write-Host $Group.MembershipRule
    Write-Host "Status: $($Group.MembershipRuleProcessingState)"
} else {
    Write-Warning "Gruppe nicht gefunden oder nicht dynamisch."
}
