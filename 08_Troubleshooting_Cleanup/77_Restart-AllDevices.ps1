<#
.SYNOPSIS
    Startet ALLE Geräte neu (Gefährlich!).
    
.DESCRIPTION
    Sendet Restart-Command an alle Devices. Nur für Testlabs!
    Erfordert die Berechtigung 'DeviceManagementManagedDevices.ReadWrite.All'.

.NOTES
    File Name: 77_Restart-AllDevices.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param()

Write-Warning "Dieses Skript startet ALLES neu. Bitte manuell bestätigen im Code."
# Code commented out for safety
# Get-MgDeviceManagementManagedDevice -All | ForEach { Restart... }
