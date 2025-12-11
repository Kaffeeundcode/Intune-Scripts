<#
.SYNOPSIS
    Lists all Mobile Apps managed by Intune.
    
.DESCRIPTION
    Retrieves a list of all apps (Win32, iOS, Android, etc.) configured in Intune.
    Requires 'DeviceManagementApps.Read.All' permission.

.NOTES
    File Name: 11_Get-AllApps.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param()

Connect-MgGraph -Scopes "DeviceManagementApps.Read.All"

$Apps = Get-MgDeviceAppMgtMobileApp -All

if ($Apps) {
    $Apps | Select-Object DisplayName, Param_Id, LargeIcon, PublishingState, CreatedDateTime | Format-Table -AutoSize
    Write-Host "Total Apps found: $($Apps.Count)" -ForegroundColor Green
} else {
    Write-Warning "No apps found."
}
