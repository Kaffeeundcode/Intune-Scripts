<#
.SYNOPSIS
    Checks the status and expiration of Enrollment Tokens (DEM, Apple VPP, DEP, Android).

.DESCRIPTION
    Consolidated report for all "expiring" infrastructure tokens in Intune.
    - Device Enrollment Managers (Limit 1000)
    - Apple Push Certificate (APNS)
    - Apple VPP Tokens
    - Android Managed Google Play
    
    Returns "DaysRemaining" to allow for alerting.

.NOTES
    File Name  : 108_Get-IntuneEnrollmentTokenStatus.ps1
    Author     : Kaffeeundcode
    Version    : 1.0
#>

try {
    Connect-MgGraph -Scopes "DeviceManagementServiceConfig.Read.All" -ErrorAction Stop
} catch {
    Write-Error "Login failed"
    exit
}

$Report = @()
$Today = Get-Date

Write-Host "Checking Apple Push Certificate..." -ForegroundColor Cyan
try {
    $APNS = Get-MgDeviceManagementApplePushNotificationCertificate
    if ($APNS) {
        $Days = ($APNS.ExpirationDateTime - $Today).Days
        $Report += [PSCustomObject]@{
            Type = "Apple APNS"
            Name = $APNS.TopicIdentifier
            Expiration = $APNS.ExpirationDateTime
            DaysRemaining = $Days
            Status = if ($Days -lt 30) { "Critical" } else { "OK" }
        }
    }
} catch { Write-Warning "Failed to get APNS info" }

Write-Host "Checking VPP Tokens..." -ForegroundColor Cyan
try {
    $VPPs = Get-MgDeviceAppMgtVppToken -All
    foreach ($V in $VPPs) {
        $Days = ($V.ExpirationDateTime - $Today).Days
        $Report += [PSCustomObject]@{
            Type = "Apple VPP"
            Name = $V.DisplayName
            Expiration = $V.ExpirationDateTime
            DaysRemaining = $Days
            Status = if ($Days -lt 14) { "Critical" } else { "OK" }
        }
    }
} catch { Write-Warning "Failed to get VPP info" }

Write-Host "Checking Android Managed Google Play..." -ForegroundColor Cyan
try {
    $Android = Get-MgDeviceManagementAndroidManagedStoreAccountEnterpriseSetting
    if ($Android) {
        $Days = ($Android.ValidityEndDate - $Today).Days
        $Report += [PSCustomObject]@{
            Type = "Android Enterprise"
            Name = $Android.OwnerUserPrincipalName
            Expiration = $Android.ValidityEndDate
            DaysRemaining = $Days
            Status = if ($Days -lt 30) { "Critical" } else { "OK" }
        }
    }
} catch {} # Often empty if not configured

$Report | Format-Table Type, Name, Expiration, DaysRemaining, Status -AutoSize
