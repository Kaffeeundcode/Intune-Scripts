<#
.SYNOPSIS
    Inactive-Admin-Hunter - Detects stale high-privileged accounts.
    
.DESCRIPTION
    Identifies users with administrative roles who have not signed in for a 
    defined period (e.g., 90 days), posing a security risk.
#>

[CmdletBinding()]
param (
    [int]$DaysInactive = 90
)

process {
    $ThresholdDate = (Get-Date).AddDays(-$DaysInactive)
    Write-Host "[INFO] Hunting for admins inactive since $ThresholdDate..." -ForegroundColor Cyan
    
    # Get users with privileged roles
    $Admins = Get-MgUser -Filter "userType eq 'Member'" -All | Where-Object { $_.JobTitle -match "Admin" }
    $StaleAdmins = @()

    foreach ($Admin in $Admins) {
        if ($Admin.SignInActivity.LastSignInDateTime -lt $ThresholdDate) {
            $StaleAdmins += [PSCustomObject]@{
                User = $Admin.DisplayName
                UPN = $Admin.UserPrincipalName
                LastSignIn = $Admin.SignInActivity.LastSignInDateTime
            }
        }
    }

    if ($StaleAdmins) {
        $StaleAdmins | Format-Table
        Write-Host "[WARNING] Found $($StaleAdmins.Count) stale admin accounts." -ForegroundColor Yellow
    } else {
        Write-Host "[SUCCESS] No stale admin accounts detected." -ForegroundColor Green
    }
}