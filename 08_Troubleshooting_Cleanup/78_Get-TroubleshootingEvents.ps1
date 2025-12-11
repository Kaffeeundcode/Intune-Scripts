<#
.SYNOPSIS
    Zeigt Troubleshooting Events.
    
.DESCRIPTION
    Liest Admin-Events aus dem Troubleshooting-Bereich.
    Erfordert die Berechtigung 'DeviceManagementServiceConfig.Read.All'.

.NOTES
    File Name: 78_Get-TroubleshootingEvents.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param()

Get-MgDeviceManagementTroubleshootingEvent -Top 20 | Format-Table EventDateTime, CorrelationId, EventName
