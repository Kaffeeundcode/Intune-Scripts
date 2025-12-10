<#
.SYNOPSIS
    Finds a Configuration Profile by Name.
    
.DESCRIPTION
    Helper to search widely for a profile.
    Requires 'DeviceManagementConfiguration.Read.All' permission.

.NOTES
    File Name: 29_Find-ProfileByName.ps1
    Author: Kaffee & Code Assistant
    Version: 1.0
#>

param(
    [Parameter(Mandatory=$true)]
    [string]$Name
)

Connect-MgGraph -Scopes "DeviceManagementConfiguration.Read.All"

$Profiles = Get-MgDeviceManagementDeviceConfiguration -Filter "contains(displayName, '$Name')"

if ($Profiles) {
    $Profiles | Select-Object DisplayName, Id, '@odata.type', LastModifiedDateTime | Format-Table
} else {
    Write-Host "No profiles found matching '$Name'."
}
