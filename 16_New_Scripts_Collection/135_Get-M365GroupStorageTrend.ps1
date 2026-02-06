<#
.SYNOPSIS
    Reports on the SharePoint storage usage for M365 Groups (Teams/Groups).

.DESCRIPTION
    Queries the associated SharePoint site for each Unified Group and reports Used Storage vs Quota.
    Top 20 consumers are displayed.

.NOTES
    File Name  : 135_Get-M365GroupStorageTrend.ps1
    Author     : Kaffeeundcode
    Version    : 1.0
#>

try {
    Connect-MgGraph -Scopes "Sites.Read.All", "Group.Read.All" -ErrorAction Stop
} catch {
    Write-Error "Login failed"
    exit
}

Write-Host "Getting M365 Group Sites..." -ForegroundColor Cyan
$Sites = Get-MgSite -Filter "siteCollection/root ne null" -All 
# Note: Filtering for group-connected sites is strictly not just root!=null, but we'll sort.

$Report = @()

foreach ($Site in $Sites) {
    # Check if this site belongs to a group (usually has similar name or can query property if beta)
    # We will get Usage info
    $Usage = Get-MgSiteUsageDetail -SiteId $Site.Id -ErrorAction SilentlyContinue
    # Graph API varies on Usage endpoint availability per permission level (Reports.Read.All preferred for usage)
    
    # Fallback: Just basic site object properties if usage endpoint fails or is separate report
    # We use the webUrl to infer group connection context or try to match with groups
    
    # Simpler approach: Get-MgGroup -> Get-MgGroupDrive (Default Drive) -> Quota
    
} 

# Alternative Iteration: Group Centric
$Groups = Get-MgGroup -Filter "groupTypes/any(g:g eq 'Unified')" -All
foreach ($Grp in $Groups) {
    try {
        $Drive = Get-MgGroupDrive -GroupId $Grp.Id -ErrorAction SilentlyContinue
        if ($Drive) {
             $UsedGB = [math]::Round($Drive.Quota.Used / 1GB, 2)
             $TotalGB = [math]::Round($Drive.Quota.Total / 1GB, 2)
             $Percent = if ($TotalGB -gt 0) { [math]::Round(($UsedGB / $TotalGB) * 100, 1) } else { 0 }
             
             $Report += [PSCustomObject]@{
                 GroupName = $Grp.DisplayName
                 SiteUrl   = $Drive.WebUrl
                 UsedGB    = $UsedGB
                 TotalGB   = $TotalGB
                 Percent   = $Percent
             }
        }
    } catch {}
}

$Report | Sort-Object UsedGB -Descending | Select-Object -First 20 | Format-Table GroupName, UsedGB, Percent -AutoSize
$Report | Export-Csv "$PSScriptRoot\Group_Storage_Usage.csv" -NoTypeInformation
