<#
.SYNOPSIS
    Gets App Installation Status for a specific User.
    
.DESCRIPTION
    Shows install status for apps assigned to a user.
    Requires 'DeviceManagementApps.Read.All' permission.

.NOTES
    File Name: 19_Get-UserAppInstallStatus.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param(
    [Parameter(Mandatory=$true)]
    [string]$UserPrincipalName
)

Connect-MgGraph -Scopes "DeviceManagementApps.Read.All", "User.Read.All"

$User = Get-MgUser -UserId $UserPrincipalName
if (-not $User) { Write-Error "User not found"; exit }

Write-Host "Fetching app status for: $($User.UserPrincipalName)"

$Status = Get-MgUserMobileAppIntentAndState -UserId $User.Id

if ($Status) {
    $Status | Select-Object MobileAppId, InstallState, Intent | Format-Table -AutoSize
} else {
    Write-Host "No status found."
}
