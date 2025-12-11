<#
.SYNOPSIS
    Listet App-Schutzrichtlinien (MAM) auf.
    
.DESCRIPTION
    Ruft eine Liste von Android- und iOS-App-Schutzrichtlinien ab.
    Erfordert die Berechtigung 'DeviceManagementApps.Read.All'.

.NOTES
    File Name: 20_Get-AppProtectionPolicies.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param()

Connect-MgGraph -Scopes "DeviceManagementApps.Read.All"

Write-Host "Lade Managed App Policies..."
$Policies = Get-MgDeviceAppMgtManagedAppPolicy -All

$Policies | Select-Object DisplayName, Id, Description, CreatedDateTime | Format-Table -AutoSize
