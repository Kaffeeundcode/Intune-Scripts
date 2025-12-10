<#
.SYNOPSIS
    Lists all Device Configuration Profiles.
    
.DESCRIPTION
    Retrieves a list of all Configuration Profiles (Settings Catalog, Admin Templates, etc. may vary in Graph type).
    Requires 'DeviceManagementConfiguration.Read.All' permission.

.NOTES
    File Name: 24_Get-ConfigurationProfiles.ps1
    Author: Kaffee & Code Assistant
    Version: 1.0
#>

param()

Connect-MgGraph -Scopes "DeviceManagementConfiguration.Read.All"

$Profiles = Get-MgDeviceManagementDeviceConfiguration -All

if ($Profiles) {
    $Profiles | Select-Object DisplayName, Id, '@odata.type', LastModifiedDateTime | Format-Table -AutoSize
    Write-Host "Total Profiles: $($Profiles.Count)" -ForegroundColor Green
} else {
    Write-Warning "No configuration profiles found."
}
