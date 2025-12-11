<#
.SYNOPSIS
    Exportiert einen Gerätestatus-Bericht als HTML.
    
.DESCRIPTION
    Erstellt eine einfache HTML-Datei mit einer Tabelle aller Geräte und deren Status.
    Erfordert die Berechtigung 'DeviceManagementManagedDevices.Read.All'.

.NOTES
    File Name: 58_Export-ReportToHtml.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param(
    [string]$Path = "$HOME/Desktop/IntuneReport.html"
)

Connect-MgGraph -Scopes "DeviceManagementManagedDevices.Read.All"

$Devices = Get-MgDeviceManagementManagedDevice -All | Select-Object DeviceName, UserPrincipalName, OperatingSystem, ComplianceState

$Header = @"
<style>
body { font-family: sans-serif; background: #222; color: #eee; }
table { border-collapse: collapse; width: 100%; }
th, td { border: 1px solid #444; padding: 8px; text-align: left; }
th { background-color: #333; }
tr:nth-child(even) { background-color: #2a2a2a; }
</style>
"@

$Devices | ConvertTo-Html -Head $Header -Title "Intune Report" | Out-File $Path
Write-Host "Report erstellt: $Path" -ForegroundColor Green
