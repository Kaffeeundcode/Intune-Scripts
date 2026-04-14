<#
.SYNOPSIS
    Simulates or enforces cleanup of M365 Groups based on custom criteria (pseudo-Lifecycle Policy).

.DESCRIPTION
    Finds Unified Groups (Teams/SharePoint) that have not been renewed or active.
    This is for tenants WITHOUT P1/P2 licenses for automatic Lifecycle Policies.
    
    Checks: RenewedDateTime (if available) or CreatedDateTime.
    Action: Soft Delete (Move to Deleted Items) if -Confirm is passed.

.NOTES
    File Name  : 113_Remove-EntraIDExpiredGroupLifecycle.ps1
    Author     : Kaffeeundcode
    Version    : 1.0
#>

Param(
    [int]$DaysLimit = 365,
    [switch]$WhatIf
)

try {
    Connect-MgGraph -Scopes "Group.ReadWrite.All" -ErrorAction Stop
} catch {
    Write-Error "Login failed"
    exit
}

$Groups = Get-MgGroup -Filter "groupTypes/any(g:g eq 'Unified')" -All -Property Id, DisplayName, RenewedDateTime, CreatedDateTime, Visibility

$Report = @()
$Today = Get-Date

foreach ($Grp in $Groups) {
    # Prefer RenewedDate, fallback to CreatedDate
    $RefDate = if ($Grp.RenewedDateTime) { $Grp.RenewedDateTime } else { $Grp.CreatedDateTime }
    
    if ($RefDate) {
        $Age = ($Today - $RefDate).Days
        
        if ($Age -gt $DaysLimit) {
            Write-Host "Expired: $($Grp.DisplayName) (Age: $Age days)" -ForegroundColor Red
            
            if ($WhatIf) {
                Write-Host " [WhatIf] Would delete group $($Grp.Id)" -ForegroundColor Gray
            } else {
                # Remove-MgGroup -GroupId $Grp.Id -ErrorAction Continue
                # Commented out for safety in default run
                Write-Warning "Deletion requires uncommenting line in script. Showing as detected only."
            }
            
            $Report += [PSCustomObject]@{
                Group = $Grp.DisplayName
                Id = $Grp.Id
                Age = $Age
                Status = "Expired"
            }
        }
    }
}

$Available = $Report.Count
if ($Available -gt 0) {
    $Report | Format-Table Group, Age, Status -AutoSize
    Write-Host "$Available groups found older than $DaysLimit days."
} else {
    Write-Host "No expired groups found." -ForegroundColor Green
}
