<#
.SYNOPSIS
    Maps Assignment Filters to the Applications and Policies that use them.

.DESCRIPTION
    Assignment Filters are powerful but hard to track. This script retrieves all
    assignment filters and then queries Apps and Policies to find where they are referenced.
    
    It outputs a mapping of Filter -> Assigned Object Name -> Object Type.

.NOTES
    File Name  : 105_Get-IntuneAssignmentFiltersUsage.ps1
    Author     : Kaffeeundcode
    Version    : 1.0
#>

try {
    Connect-MgGraph -Scopes "DeviceManagementApps.Read.All", "DeviceManagementConfiguration.Read.All" -ErrorAction Stop
} catch {
    Write-Error "Login failed"
    exit
}

Write-Host "Getting Assignment Filters..." -ForegroundColor Cyan
$Filters = Get-MgDeviceManagementAssignmentFilter -All

if (-not $Filters) {
    Write-Warning "No filters found."
    exit
}

$Report = @()

Write-Host "Analyzing $($Filters.Count) filters against Assignments (This may take time)..." -ForegroundColor Yellow

# Note: Graph does not have a "Get-MgDeviceManagementAssignmentFilterUsage" directly exposed easily in all SDK versions.
# We must inverse scan: Check Apps/Policies and see if they have filters.
# This can be slow in large tenants. A more optimized way is usually unavailable without bulk export.
# For efficiency in this script, we will check a subset of common objects: Win32 Apps and Device Configs.

$Apps = Get-MgDeviceAppMgtMobileApp -All
$Configs = Get-MgDeviceManagementDeviceConfiguration -All

foreach ($Filter in $Filters) {
    Write-Host " - Checking usage for: $($Filter.DisplayName)" -NoNewline

    # Check Apps
    foreach ($App in $Apps) {
        # Check assignments
        try {
            $Assigns = Get-MgDeviceAppMgtMobileAppAssignment -MobileAppId $App.Id -All -ErrorAction SilentlyContinue
            foreach ($Asn in $Assigns) {
                # Target can have a filter ID mapping usually in 'Target' complex object or separate property depending on API version
                # In Beta, it's often more visible. V1.0 might hide it inside specific objects.
                # Use a specific property check.
                
                # Check properties of the assignment for filter ID match
                # The SDK object structure varies. We look for commonly known patterns.
                if ($Asn.Target.DeviceAndAppManagementAssignmentFilterId -eq $Filter.Id) {
                    $Report += [PSCustomObject]@{
                        FilterName = $Filter.DisplayName
                        FilterId   = $Filter.Id
                        UsedBy     = $App.DisplayName
                        Type       = "Application"
                        Platform   = $Filter.Platform
                    }
                    Write-Host "." -NoNewline -ForegroundColor Green
                }
            }
        } catch {}
    }

    # Check Configs
    foreach ($Cfg in $Configs) {
        try {
            $Assigns = Get-MgDeviceManagementDeviceConfigurationAssignment -DeviceConfigurationId $Cfg.Id -All -ErrorAction SilentlyContinue
            foreach ($Asn in $Assigns) {
                 if ($Asn.Target.DeviceAndAppManagementAssignmentFilterId -eq $Filter.Id) {
                    $Report += [PSCustomObject]@{
                        FilterName = $Filter.DisplayName
                        FilterId   = $Filter.Id
                        UsedBy     = $Cfg.DisplayName
                        Type       = "Configuration Profile"
                        Platform   = $Filter.Platform
                    }
                    Write-Host "." -NoNewline -ForegroundColor Green
                 }
            }
        } catch {}
    }
    Write-Host ""
}

$Report | Format-Table FilterName, UsedBy, Type -AutoSize
$Path = "$PSScriptRoot\Assignment_Filters_Usage.csv"
$Report | Export-Csv -Path $Path -NoTypeInformation
Write-Host "Report saved to $Path" -ForegroundColor Green
