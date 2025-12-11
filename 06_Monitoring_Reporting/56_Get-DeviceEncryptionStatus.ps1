<#
.SYNOPSIS
    Prüft Verschlüsselungsstatus aller Geräte.
    
.DESCRIPTION
    Listet Geräte auf, die nicht verschlüsselt sind.
    Erfordert die Berechtigung 'DeviceManagementManagedDevices.Read.All'.

.NOTES
    File Name: 56_Get-DeviceEncryptionStatus.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param()

Connect-MgGraph -Scopes "DeviceManagementManagedDevices.Read.All"

$Devices = Get-MgDeviceManagementManagedDevice -Filter "isEncrypted eq false"
Write-Host "Unverschlüsselte Geräte: $($Devices.Count)" -ForegroundColor Red
$Devices | Select-Object DeviceName, OperatingSystem, UserPrincipalName
