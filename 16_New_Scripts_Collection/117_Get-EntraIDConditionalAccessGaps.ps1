<#
.SYNOPSIS
    Identifies users who are NOT covered by specific critical Conditional Access policies.

.DESCRIPTION
    Checks all Enabled CA policies.
    If a policy targets "All Users" but has Exclusions, it lists the Excluded users.
    If a policy targets specific groups, it's harder to check gaps without a "baseline".
    
    Focus: Finding users consistently excluded from MFA or Block Legacy Auth rules.

.NOTES
    File Name  : 117_Get-EntraIDConditionalAccessGaps.ps1
    Author     : Kaffeeundcode
    Version    : 1.0
#>

try {
    Connect-MgGraph -Scopes "Policy.Read.All", "Group.Read.All", "User.Read.All" -ErrorAction Stop
} catch {
    Write-Error "Login failed"
    exit
}

$Policies = Get-MgIdentityConditionalAccessPolicy -All | Where-Object { $_.State -eq "enabled" }

$Report = @()

foreach ($Pol in $Policies) {
    # Check Exclusions
    $ExcludedUsers = $Pol.Conditions.Users.ExcludeUsers
    $ExcludedGroups = $Pol.Conditions.Users.ExcludeGroups
    $ExcludedRoles = $Pol.Conditions.Users.ExcludeRoles
    
    if ($ExcludedUsers -or $ExcludedGroups -or $ExcludedRoles) {
        
        $ResolvedExclusions = @()
        
        # Direct User Exclusions
        if ($ExcludedUsers) {
             foreach ($UId in $ExcludedUsers) {
                 if ($UId -eq "GuestsOrExternalUsers") { $ResolvedExclusions += "All Guests" }
                 else {
                     try { $U = Get-MgUser -UserId $UId; $ResolvedExclusions += $U.UserPrincipalName } catch { $ResolvedExclusions += $UId }
                 }
             }
        }
        
        # Group Exclusions
        if ($ExcludedGroups) {
             foreach ($GId in $ExcludedGroups) {
                 try { $G = Get-MgGroup -GroupId $GId; $ResolvedExclusions += "Group: $($G.DisplayName)" } catch { $ResolvedExclusions += $GId }
             }
        }
        
        $Report += [PSCustomObject]@{
            PolicyName = $Pol.DisplayName
            GrantControls = ($Pol.GrantControls.BuiltInControls -join ", ")
            Exclusions = ($ResolvedExclusions -join "; ")
        }
    }
}

$Report | Format-Table PolicyName, Exclusions -AutoSize
$Path = "$PSScriptRoot\CA_Exclusion_Report.csv"
$Report | Export-Csv -Path $Path -NoTypeInformation
Write-Host "Exclusions report saved to $Path" -ForegroundColor Green
