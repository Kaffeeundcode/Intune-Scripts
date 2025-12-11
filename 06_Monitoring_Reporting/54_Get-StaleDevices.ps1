<#
.SYNOPSIS
    Identifiziert inaktive Geräte (Stale Devices).
    
.DESCRIPTION
    Findet Geräte, die sich seit X Tagen nicht gemeldet haben.
    Standard: 30 Tage.
    Erfordert die Berechtigung 'DeviceManagementManagedDevices.Read.All'.

.NOTES
    File Name: 54_Get-StaleDevices.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [int]$Days = 30
)

Connect-MgGraph -Scopes "DeviceManagementManagedDevices.Read.All"

$Date = (Get-Date).AddDays(-$Days)
$Devices = Get-MgDeviceManagementManagedDevice -Filter "lastSyncDateTime lt $Date"

Write-Host "Geräte inaktiv seit $Date : $($Devices.Count)" -ForegroundColor Yellow
$Devices | Select-Object DeviceName, LastSyncDateTime, UserPrincipalName
