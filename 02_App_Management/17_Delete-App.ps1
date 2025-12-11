<#
.SYNOPSIS
    Löscht eine App aus Intune.
    
.DESCRIPTION
    Entfernt die App und ihre Zuweisungen dauerhaft.
    Erfordert die Berechtigung 'DeviceManagementApps.ReadWrite.All'.

.NOTES
    File Name: 17_Delete-App.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [Parameter(Mandatory=$true)]
    [string]$AppId
)

Connect-MgGraph -Scopes "DeviceManagementApps.ReadWrite.All"

try {
    Remove-MgDeviceAppMgtMobileApp -MobileAppId $AppId -Confirm:$false
    Write-Host "App $AppId wurde gelöscht." -ForegroundColor Green
} catch {
    Write-Error "Fehler beim Löschen: $_"
}
