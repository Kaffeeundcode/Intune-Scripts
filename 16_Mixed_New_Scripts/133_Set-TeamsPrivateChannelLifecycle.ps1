<#
.SYNOPSIS
    Archives or alerts on Teams Private Channels with no recent activity.

.DESCRIPTION
    Private channels have their own separate SharePoint sites.
    When a Team is archived, private channels might remain ignored.
    This script finds private channels where the underlying site has not been modified recently.

.NOTES
    File Name  : 133_Set-TeamsPrivateChannelLifecycle.ps1
    Author     : Kaffeeundcode
    Version    : 1.0
#>

Param(
    [int]$Days = 180
)

try {
    Connect-MgGraph -Scopes "Group.Read.All", "Sites.Read.All", "ChannelMember.Read.All" -ErrorAction Stop
} catch {
    Write-Error "Login failed"
    exit
}

Write-Host "Scanning Private Channels (Inactive > $Days days)..." -ForegroundColor Cyan
$Teams = Get-MgGroup -Filter "resourceProvisioningOptions/Any(x:x eq 'Team')" -All

$Report = @()
$Cutoff = (Get-Date).AddDays(-$Days)

foreach ($Team in $Teams) {
    # Get Channels
    $Channels = Get-MgTeamChannel -TeamId $Team.Id -All | Where-Object { $_.MembershipType -eq "private" }
    
    foreach ($Chan in $Channels) {
        # Check Files Folder (SharePoint)
        # We need the drive item for the channel
        try {
            $FilesFolder = Get-MgTeamChannelFilesFolder -TeamId $Team.Id -ChannelId $Chan.Id -ErrorAction SilentlyContinue
            if ($FilesFolder) {
                if ($FilesFolder.LastModifiedDateTime -lt $Cutoff) {
                     $Report += [PSCustomObject]@{
                         Team = $Team.DisplayName
                         Channel = $Chan.DisplayName
                         LastModified = $FilesFolder.LastModifiedDateTime
                         Status = "Inactive"
                     }
                }
            }
        } catch {
            Write-Warning "Could not access files for $($Chan.DisplayName)"
        }
    }
}

$Report | Format-Table Team, Channel, LastModified -AutoSize
$Report | Export-Csv "$PSScriptRoot\Inactive_Private_Channels.csv" -NoTypeInformation
Write-Host "Done." -ForegroundColor Green
