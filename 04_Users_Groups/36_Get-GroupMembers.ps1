<#
.SYNOPSIS
    Lists Members of a Group.
    
.DESCRIPTION
    Requires 'GroupMember.Read.All' permission.

.NOTES
    File Name: 36_Get-GroupMembers.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param(
    [Parameter(Mandatory=$true)]
    [string]$GroupId
)

Connect-MgGraph -Scopes "GroupMember.Read.All"

$Members = Get-MgGroupMember -GroupId $GroupId -All

if ($Members) {
    # Extract details (Members can be Users, Groups, Devices)
    foreach ($m in $Members) {
        # Graph returns minimal info in generic member listing, usually need to cast or check type
        # We can try to look at AdditionalProperties or just ID
        $Type = $m.AdditionalProperties['@odata.type']
        $Id = $m.Id
        Write-Host "Member: $Id ($Type)"
    }
} else {
    Write-Host "Group is empty."
}
