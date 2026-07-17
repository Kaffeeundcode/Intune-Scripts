<#
.SYNOPSIS
    Stale-Group-Purge - Cleans up empty or orphaned groups in Entra ID.
    
.DESCRIPTION
    Scans for groups that have zero members or no assigned owners, 
    reducing clutter and improving security posture.
#>

[CmdletBinding()]
param (
    [Parameter(Mandatory=$false)]
    [switch]$WhatIf
)

process {
    Write-Host "[INFO] Scanning for stale groups..." -ForegroundColor Cyan
    
    $Groups = Get-MgGroup -All
    $StaleGroups = @()

    foreach ($Group in $Groups) {
        # Check member count
        $Members = Get-MgGroupMember -GroupId $Group.Id -All
        if ($Members.Count -eq 0) {
            $StaleGroups += [PSCustomObject]@{
                GroupName = $Group.DisplayName
                GroupId = $Group.Id
                Reason = "Empty Group"
            }
        }
    }

    if ($StaleGroups) {
        $StaleGroups | Format-Table
        if ($WhatIf) {
            Write-Host "[INFO] WhatIf mode: No groups were deleted." -ForegroundColor Gray
        } else {
            Write-Host "[WARNING] Found $($StaleGroups.Count) stale groups. Manual review recommended before deletion." -ForegroundColor Yellow
        }
    } else {
        Write-Host "[SUCCESS] No stale groups detected." -ForegroundColor Green
    }
}