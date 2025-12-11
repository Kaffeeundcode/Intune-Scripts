<#
.SYNOPSIS
    Bereinigt inaktive Geräte (Löschen).
    
.DESCRIPTION
    Löscht Geräte, die länger als X Tage inaktiv waren.
    WARNUNG: Destruktive Aktion!
    Erfordert die Berechtigung 'DeviceManagementManagedDevices.ReadWrite.All'.

.NOTES
    File Name: 75_Clean-StaleDevices.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [int]$Days = 90,
    [switch]$Force
)

Connect-MgGraph -Scopes "DeviceManagementManagedDevices.ReadWrite.All"

$Date = (Get-Date).AddDays(-$Days)
$Devices = Get-MgDeviceManagementManagedDevice -Filter "lastSyncDateTime lt $Date"

foreach ($Dev in $Devices) {
    if ($Force) {
        Remove-MgDeviceManagementManagedDevice -ManagedDeviceId $Dev.Id -Confirm:$false
        Write-Host "Gelöscht: $($Dev.DeviceName)" -ForegroundColor Red
    } else {
        Write-Host "Wäre gelöscht (Stale): $($Dev.DeviceName) ($($Dev.LastSyncDateTime))" -ForegroundColor Yellow
    }
}
