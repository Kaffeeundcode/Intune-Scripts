<#
.SYNOPSIS
    Identifies Microsoft Teams that have no owners.

.DESCRIPTION
    "Orphaned" Teams are hard to manage because no user has control.
    This script scans all groups associated with Teams and checks for owner count = 0.

.NOTES
    File Name  : 131_Get-TeamsOrphanedTeams.ps1
    Author     : Kaffeeundcode
    Version    : 1.0
#>

try {
    Connect-MgGraph -Scopes "Group.Read.All", "User.Read.All" -ErrorAction Stop
} catch {
    Write-Error "Login failed"
    exit
}

Write-Host "Scanning Teams for missing owners..." -ForegroundColor Cyan

# Get all Unified Groups that have 'Team' resource provisioning
# A reliable filter is identifying groups with resourceProvisioningOptions -contains 'Team'
# Note: In Graph V1.0, filtering on string collection might be tricky, we'll grab all unified and filter client side for safety if tenant is small-medium.
# For large tenants, filter "resourceProvisioningOptions/Any(x:x eq 'Team')"

$TeamsGroups = Get-MgGroup -Filter "groupTypes/any(g:g eq 'Unified') and resourceProvisioningOptions/Any(x:x eq 'Team')" -All

$Report = @()

foreach ($Group in $TeamsGroups) {
    try {
        $Owners = Get-MgGroupOwner -GroupId $Group.Id -All
        if ($Owners.Count -eq 0) {
            Write-Host "Orphaned Team found: $($Group.DisplayName)" -ForegroundColor Yellow
            $Report += [PSCustomObject]@{
                TeamName = $Group.DisplayName
                GroupId = $Group.Id
                Visibility = $Group.Visibility
                Status = "Orphaned (0 Owners)"
            }
        }
    } catch {
        Write-Warning "Failed to check owners for $($Group.DisplayName)"
    }
}

if ($Report.Count -gt 0) {
    $Report | Format-Table TeamName, Status -AutoSize
    $Report | Export-Csv "$PSScriptRoot\Orphaned_Teams.csv" -NoTypeInformation
} else {
    Write-Host "No orphaned teams found." -ForegroundColor Green
}
