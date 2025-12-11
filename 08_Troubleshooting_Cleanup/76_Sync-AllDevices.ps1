<#
.SYNOPSIS
    Synchronisiert ALLE Geräte (Massenaktion).
    
.DESCRIPTION
    Sendet Sync-Befehl an jedes verwaltete Gerät. Vorsicht bei großen Umgebungen (Throttling)!
    Erfordert die Berechtigung 'DeviceManagementManagedDevices.ReadWrite.All'.

.NOTES
    File Name: 76_Sync-AllDevices.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param()

Connect-MgGraph -Scopes "DeviceManagementManagedDevices.ReadWrite.All"

$Devices = Get-MgDeviceManagementManagedDevice -All
foreach ($Dev in $Devices) {
    Sync-MgDeviceManagementManagedDevice -ManagedDeviceId $Dev.Id -ErrorAction SilentlyContinue
    Write-Host "Sync: $($Dev.DeviceName)"
}
