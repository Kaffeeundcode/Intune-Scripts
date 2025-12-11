<#
.SYNOPSIS
    Findet alle nicht-konformen (Non-Compliant) Geräte.
    
.DESCRIPTION
    Filtert die Geräteliste nach dem Status 'nonCompliant'.
    Hilfreich für Reports und Alerts.
    Erfordert die Berechtigung 'DeviceManagementManagedDevices.Read.All'.

.NOTES
    File Name: 22_Get-NonCompliantDevices.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param()

Connect-MgGraph -Scopes "DeviceManagementManagedDevices.Read.All"

$Devices = Get-MgDeviceManagementManagedDevice -Filter "complianceState eq 'nonCompliant'"

if ($Devices) {
    Write-Host "Achtung: $($Devices.Count) nicht-konforme Geräte gefunden!" -ForegroundColor Red
    $Devices | Select-Object DeviceName, UserPrincipalName, OperatingSystem, ComplianceState, LastSyncDateTime | Format-Table -AutoSize
} else {
    Write-Host "Keine Non-Compliant Geräte gefunden. Alles sauber!" -ForegroundColor Green
}
