<#
.SYNOPSIS
    Listet alle mobilen Geräte (ActiveSync) auf, die mit Exchange verbunden sind.

.DESCRIPTION
    Zeigt DeviceModel, OS und letzten Sync-Zeitpunkt.
    Unabhängig von Intune (nur Exchange ActiveSync Sicht).

    Parameter:
    - UserPrincipalName: (Optional) Filter auf User.

.NOTES
    File Name: 070_Get-ExoMobileDeviceStatistics.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [Parameter(Mandatory=$false)] [string]$UserPrincipalName
)

try {
    Write-Host "Rufe Mobile Device Statistiken ab..." -ForegroundColor Cyan
    
    $Mailboxes = if ($UserPrincipalName) { Get-ExoMailbox -Identity $UserPrincipalName } else { Get-ExoMailbox -ResultSize Unlimited }
    
    foreach ($mb in $Mailboxes) {
        $Devices = Get-MobileDeviceStatistics -Mailbox $mb.UserPrincipalName -ErrorAction SilentlyContinue
        
        foreach ($dev in $Devices) {
            [PSCustomObject]@{
                User = $mb.UserPrincipalName
                DeviceType = $dev.DeviceType
                Model = $dev.DeviceModel
                OS = $dev.DeviceOS
                LastSuccessSync = $dev.LastSuccessSync
                Status = $dev.Status
            }
        }
    }

} catch {
    Write-Error "Fehler: $_"
}
