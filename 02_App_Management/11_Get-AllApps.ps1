<#
.SYNOPSIS
    Listet alle verwalteten Apps in Intune auf.
    
.DESCRIPTION
    Ruft eine Liste aller Apps (Win32, iOS, Android etc.) ab, die in Intune konfiguriert sind.
    Erfordert die Berechtigung 'DeviceManagementApps.Read.All'.

.NOTES
    File Name: 11_Get-AllApps.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param()

Connect-MgGraph -Scopes "DeviceManagementApps.Read.All"

$Apps = Get-MgDeviceAppMgtMobileApp -All

Write-Host "Gefundene Apps: $($Apps.Count)" -ForegroundColor Cyan
$Apps | Select-Object DisplayName, Id, @{N='Platform';E={$_.ObjektType}}, CreatedDateTime | Format-Table -AutoSize
