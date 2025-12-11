<#
.SYNOPSIS
    Lists Security Baselines.
    
.DESCRIPTION
    Requires 'DeviceManagementConfiguration.Read.All' permission.

.NOTES
    File Name: 67_Get-SecurityBaselines.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param()

Connect-MgGraph -Scopes "DeviceManagementConfiguration.Read.All"

$Baselines = Get-MgDeviceManagementTemplate -Filter "isof('microsoft.graph.securityBaselineTemplate')"

if ($Baselines) {
    $Baselines | Select-Object DisplayName, Id, VersionInfo | Format-Table
} else {
    Write-Host "No Security Baselines found."
}
