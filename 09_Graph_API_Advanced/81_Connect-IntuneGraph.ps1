<#
.SYNOPSIS
    Connects to Microsoft Graph with specific scopes.
    
.DESCRIPTION
    A reusable wrapper to connect to Graph for Intune management.
    Handles scope definition.

.NOTES
    File Name: 81_Connect-IntuneGraph.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param(
    [switch]$ReadWrite
)

$Scopes = @(
    "DeviceManagementManagedDevices.Read.All",
    "DeviceManagementApps.Read.All",
    "DeviceManagementConfiguration.Read.All",
    "User.Read.All",
    "Group.Read.All"
)

if ($ReadWrite) {
    $Scopes += "DeviceManagementManagedDevices.ReadWrite.All"
    $Scopes += "DeviceManagementApps.ReadWrite.All"
    $Scopes += "DeviceManagementConfiguration.ReadWrite.All"
    $Scopes += "Group.ReadWrite.All"
}

Write-Host "Connecting to Microsoft Graph..."
Connect-MgGraph -Scopes $Scopes
Write-Host "Connected as $(Get-MgContext | Select-Object -ExpandProperty Account)" -ForegroundColor Green
