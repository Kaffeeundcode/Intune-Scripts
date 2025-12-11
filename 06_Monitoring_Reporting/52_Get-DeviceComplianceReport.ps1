<#
.SYNOPSIS
    Erstellt einen schnellen Compliance-Bericht.
    
.DESCRIPTION
    Zählt Compliant vs. Non-Compliant Geräte und gibt eine Pivot-Tabelle aus.
    Erfordert die Berechtigung 'DeviceManagementManagedDevices.Read.All'.

.NOTES
    File Name: 52_Get-DeviceComplianceReport.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param()

Connect-MgGraph -Scopes "DeviceManagementManagedDevices.Read.All"

$Devices = Get-MgDeviceManagementManagedDevice -All
$Report = $Devices | Group-Object ComplianceState

$Report | Select-Object Name, Count | Format-Table -AutoSize
