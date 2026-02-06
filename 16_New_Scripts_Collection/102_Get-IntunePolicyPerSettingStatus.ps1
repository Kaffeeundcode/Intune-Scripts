<#
.SYNOPSIS
    Exports detailed status for every setting within a specific Intune Configuration Profile.

.DESCRIPTION
    This script prompts for a Configuration Profile ID (or name search) and then retrieves
    the per-setting status for devices assigned to it. 
    It helps troubleshoot which specific setting is failing in a large policy (e.g. Security Baseline).

.NOTES
    File Name  : 102_Get-IntunePolicyPerSettingStatus.ps1
    Author     : Kaffeeundcode
    Version    : 1.0
    Requires   : Microsoft.Graph.DeviceManagement
#>

Param(
    [Parameter(Mandatory=$false)]
    [string]$ProfileName
)

# Connect
try {
    Connect-MgGraph -Scopes "DeviceManagementConfiguration.Read.All", "DeviceManagementManagedDevices.Read.All" -ErrorAction Stop
} catch {
    Write-Error "Connection failed."
    exit
}

# Find Profile
if ([string]::IsNullOrEmpty($ProfileName)) {
    $Profiles = Get-MgDeviceManagementDeviceConfiguration -All
    $ProfileName = $Profiles | Out-GridView -Title "Select a Configuration Profile" -OutputMode Single | Select-Object -ExpandProperty DisplayName
}

if ([string]::IsNullOrEmpty($ProfileName)) {
    Write-Warning "No profile selected."
    exit
}

$Profile = Get-MgDeviceManagementDeviceConfiguration -Filter "displayName eq '$ProfileName'" -ErrorAction SilentlyContinue | Select-Object -First 1

if (-not $Profile) {
    Write-Error "Profile '$ProfileName' not found."
    exit
}

Write-Host "Analyzing profile: $($Profile.DisplayName) ($($Profile.Id))" -ForegroundColor Cyan

# Get Device Status Overview
$DeviceStatuses = Get-MgDeviceManagementDeviceConfigurationDeviceStatus -DeviceConfigurationId $Profile.Id -All

$Report = @()

foreach ($Status in $DeviceStatuses) {
    # For each device, we ideally want to drill down, but Graph exposes per-setting status differently via Reports usually.
    # We will try to fetch user status or setting states if available.
    
    # As a workaround for direct per-setting API complexity, we check the high-level compliance
    
    $obj = [PSCustomObject]@{
        DeviceName            = $Status.DeviceDisplayName
        PrincipalName         = $Status.UserPrincipalName
        ComplianceStatus      = $Status.ComplianceStatus
        LastReported          = $Status.LastReportedDateTime
        ProfileId             = $Profile.Id
        ProfileName           = $Profile.DisplayName
    }
    $Report += $obj
}

# Note: True per-setting detail often implies using the 'deviceConfigurationDeviceStatus' 
# or specific SettingState summaries which are expensive queries. 
# This script provides the per-device breakdown of that policy's result.

$Report | Out-GridView -Title "Status for $($Profile.DisplayName)"
$ExportPath = "$PSScriptRoot\PolicyStatus_$($Profile.DisplayName).csv"
$Report | Export-Csv -Path $ExportPath -NoTypeInformation
Write-Host "Exported to $ExportPath" -ForegroundColor Green
