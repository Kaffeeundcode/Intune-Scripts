<#
.SYNOPSIS
    Gets App Installation Status for a specific Device.
    
.DESCRIPTION
    Shows which apps are installed, failed, or pending on a device.
    Requires 'DeviceManagementApps.Read.All' permission.

.NOTES
    File Name: 18_Get-DeviceAppInstallStatus.ps1
    Author: Kaffee & Code Assistant
    Version: 1.0
#>

param(
    [Parameter(Mandatory=$true)]
    [string]$DeviceName
)

Connect-MgGraph -Scopes "DeviceManagementApps.Read.All", "DeviceManagementManagedDevices.Read.All"

# 1. Get Device ID
$Device = Get-MgDeviceManagementManagedDevice -Filter "deviceName eq '$DeviceName'"
if (-not $Device) { Write-Error "Device not found"; exit }

Write-Host "Fetching app status for: $($Device.DeviceName)"

# 2. Get Install Summaries
# Note: Graph API structure for this is complex. We often look at 'deviceAppManagement/mobileAppInstallStatuses'
# filtered by deviceId? Or per app. 
# A easier way is to query the specific device's 'deviceAppManagement' navigation if available, but usually we filter the top level.

$Status = Get-MgDeviceAppMgtMobileAppInstallStatus -Filter "deviceId eq '$($Device.Id)'"

if ($Status) {
    # We might need to resolve App IDs to names if not included
    foreach ($S in $Status) {
        # Attempt to get app name if display name is missing
        $AppName = $S.MobileApp.DisplayName
        if (-not $AppName) { $AppName = "AppID: $($S.AppId)" }
        
        Write-Host "App: $AppName | Status: $($S.InstallState)"
    }
} else {
    Write-Host "No app status records found for this device." -ForegroundColor Yellow
}
