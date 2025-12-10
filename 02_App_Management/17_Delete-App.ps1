<#
.SYNOPSIS
    Deletes an App from Intune.
    
.DESCRIPTION
    Permanently removes the app and its assignments.
    Requires 'DeviceManagementApps.ReadWrite.All' permission.

.NOTES
    File Name: 17_Delete-App.ps1
    Author: Kaffee & Code Assistant
    Version: 1.0
#>

param(
    [Parameter(Mandatory=$true)]
    [string]$AppName
)

Connect-MgGraph -Scopes "DeviceManagementApps.ReadWrite.All"

$App = Get-MgDeviceAppMgtMobileApp -Filter "displayName eq '$AppName'"
if ($App -is [array]) { $App = $App[0] }

if ($App) {
    Write-Warning "Deleting App: $($App.DisplayName) (ID: $($App.Id))"
    $Confirm = Read-Host "Type 'DELETE' to confirm"
    if ($Confirm -eq 'DELETE') {
        Remove-MgDeviceAppMgtMobileApp -MobileAppId $App.Id
        Write-Host "App deleted." -ForegroundColor Green
    }
} else {
    Write-Warning "App '$AppName' not found."
}
