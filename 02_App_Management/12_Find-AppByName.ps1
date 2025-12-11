<#
.SYNOPSIS
    Findet eine App anhand ihres Anzeigenamens.
    
.DESCRIPTION
    Sucht nach Apps, die dem angegebenen Namen entsprechen.
    Erfordert die Berechtigung 'DeviceManagementApps.Read.All'.

.NOTES
    File Name: 12_Find-AppByName.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [Parameter(Mandatory=$true)]
    [string]$AppName
)

Connect-MgGraph -Scopes "DeviceManagementApps.Read.All"

$Apps = Get-MgDeviceAppMgtMobileApp -Filter "startswith(displayName, '$AppName')" 

if ($Apps) {
    $Apps | Select-Object DisplayName, Id, AppId
} else {
    Write-Warning "Keine App gefunden, die mit '$AppName' beginnt."
}
