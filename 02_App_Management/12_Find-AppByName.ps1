<#
.SYNOPSIS
    Finds an app by its specific display name.
    
.DESCRIPTION
    Search for apps matching a name string.
    Requires 'DeviceManagementApps.Read.All' permission.

.NOTES
    File Name: 12_Find-AppByName.ps1
    Author: Kaffee & Code Assistant
    Version: 1.0
#>

param(
    [Parameter(Mandatory=$true)]
    [string]$AppName
)

Connect-MgGraph -Scopes "DeviceManagementApps.Read.All"

$Apps = Get-MgDeviceAppMgtMobileApp -Filter "contains(displayName, '$AppName')"

if ($Apps) {
    $Apps | Select-Object DisplayName, Id, '@odata.type', CreatedDateTime | Format-Table -AutoSize
} else {
    Write-Warning "No apps found containing '$AppName'."
}
