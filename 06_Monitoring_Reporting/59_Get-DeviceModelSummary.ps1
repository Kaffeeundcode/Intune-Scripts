<#
.SYNOPSIS
    Zusammenfassung der Gerätemodelle.
    
.DESCRIPTION
    Gruppiert Geräte nach Modell und Hersteller.
    Erfordert die Berechtigung 'DeviceManagementManagedDevices.Read.All'.

.NOTES
    File Name: 59_Get-DeviceModelSummary.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param()

Connect-MgGraph -Scopes "DeviceManagementManagedDevices.Read.All"

Get-MgDeviceManagementManagedDevice -All | Group-Object Model | Select-Object Count, Name | Sort-Object Count -Descending | Format-Table -AutoSize
