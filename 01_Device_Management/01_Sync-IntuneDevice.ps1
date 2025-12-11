<#
.SYNOPSIS
    Löst eine manuelle Synchronisierung für ein bestimmtes Intune-Gerät aus.
    
.DESCRIPTION
    Dieses Skript verbindet sich mit Microsoft Graph und stößt die Synchronisierungsaktion für ein Gerät an, das über seinen Namen angegeben wird.
    Erfordert die Berechtigung 'DeviceManagementManagedDevices.ReadWrite.All'.

.NOTES
    File Name: 01_Sync-IntuneDevice.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [Parameter(Mandatory=$true, HelpMessage="Der Name des Geräts")]
    [string]$DeviceName
)

try {
    Connect-MgGraph -Scopes "DeviceManagementManagedDevices.ReadWrite.All" -ErrorAction Stop
} catch {
    Write-Error "Verbindung zu Graph fehlgeschlagen. Bitte prüfen Sie das Modul."
    exit
}

$Device = Get-MgDeviceManagementManagedDevice -Filter "deviceName eq '$DeviceName'" -ErrorAction SilentlyContinue

if ($null -eq $Device) {
    Write-Warning "Gerät '$DeviceName' nicht gefunden."
    exit
}

try {
    Sync-MgDeviceManagementManagedDevice -ManagedDeviceId $Device.Id -ErrorAction Stop
    Write-Host "Sync erfolgreich ausgelöst für: $($Device.DeviceName)" -ForegroundColor Green
} catch {
    Write-Error "Fehler beim Sync: $_"
}
