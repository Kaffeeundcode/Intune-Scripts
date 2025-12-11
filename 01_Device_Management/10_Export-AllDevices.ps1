<#
.SYNOPSIS
    Exportiert alle Intune-Geräte in eine CSV-Datei.
    
.DESCRIPTION
    Lädt alle Geräte herunter und exportiert Schlüsseleigenschaften (Name, Seriennummer, OS, Nutzer, Compliance) in eine CSV.
    Erfordert die Berechtigung 'DeviceManagementManagedDevices.Read.All'.

.NOTES
    File Name: 10_Export-AllDevices.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [string]$Path = "$HOME/Desktop/IntuneDevices.csv"
)

Connect-MgGraph -Scopes "DeviceManagementManagedDevices.Read.All"

Write-Host "Lade Geräte..."
$Devices = Get-MgDeviceManagementManagedDevice -All

$Export = $Devices | Select-Object DeviceName, Id, OperatingSystem, OsVersion, SerialNumber, ComplianceState, LastSyncDateTime, UserPrincipalName

$Export | Export-Csv -Path $Path -NoTypeInformation
Write-Host "Export gespeichert unter: $Path" -ForegroundColor Green
