<#
.SYNOPSIS
    Audits 3rd party apps installed in Teams and their permissions.

.DESCRIPTION
    Lists all Apps installed in Teams (Tenant-wide automation).
    It checks if they are blocked or allowed by tenant settings.

.NOTES
    File Name  : 136_Get-TeamsAppPermissionGrants.ps1
    Author     : Kaffeeundcode
    Version    : 1.0
#>

try {
    Connect-MgGraph -Scopes "TeamsAppInstallation.ReadForTeam.All", "Team.ReadBasic.All" -ErrorAction Stop
} catch {
    Write-Error "Login failed"
    exit
}

Write-Host "Scanning Teams for App Installs..." -ForegroundColor Cyan

$Teams = Get-MgTeam -All
$Report = @()

foreach ($Team in $Teams) {
    try {
        $Apps = Get-MgTeamCandidateTeamsApp -TeamId $Team.Id -ErrorAction SilentlyContinue 
        # Or Get-MgTeamInstalledApp
        $Installed = Get-MgTeamInstalledApp -TeamId $Team.Id -ExpandProperty "teamsAppDefinition"
        
        foreach ($App in $Installed) {
            $Def = $App.TeamsAppDefinition
            
            # Filter non-Microsoft
            if ($Def.PublishingState -ne "published") { # Custom apps often
                $Type = "Custom/Sideloaded"
            } elseif ($Def.DisplayName -match "Microsoft") {
                $Type = "Microsoft"
            } else {
                $Type = "Third Party"
            }
            
            $Report += [PSCustomObject]@{
                Team = $Team.DisplayName
                AppName = $Def.DisplayName
                Version = $Def.Version
                Type = $Type
                AppId = $Def.TeamsAppId
            }
        }
    } catch {}
}

$Report | Group-Object AppName | Sort-Object Count -Descending | Select-Object Name, Count | Format-Table -AutoSize
$Report | Export-Csv "$PSScriptRoot\Teams_Apps_Installed.csv" -NoTypeInformation
Write-Host "Saved." -ForegroundColor Green
