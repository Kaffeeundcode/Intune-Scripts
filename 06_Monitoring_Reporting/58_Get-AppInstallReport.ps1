<#
.SYNOPSIS
    Generates Application Installation Report.
    
.DESCRIPTION
    Shows success/fail counts for a specific app.
    Requires 'DeviceManagementApps.Read.All' permission.

.NOTES
    File Name: 58_Get-AppInstallReport.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param(
    [Parameter(Mandatory=$true)]
    [string]$AppName
)

Connect-MgGraph -Scopes "DeviceManagementApps.Read.All", "DeviceManagementManagedDevices.Read.All"

$App = Get-MgDeviceAppMgtMobileApp -Filter "displayName eq '$AppName'"
if ($App -is [array]) { $App = $App[0] }

if ($App) {
    $Stats = Get-MgDeviceAppMgtMobileAppDeviceStatus -MobileAppId $App.Id
    if ($Stats) {
        $Stats | Group-Object InstallState | Select-Object Name, Count | Format-Table
    } else {
        Write-Host "No install data available yet."
    }
} else {
    Write-Warning "App not found."
}
