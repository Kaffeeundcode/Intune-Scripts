<#
.SYNOPSIS
    Listet alle Compliance-Richtlinien auf.
    
.DESCRIPTION
    Ruft eine Liste aller in Intune definierten Compliance-Policies ab (iOS, Android, Windows etc.).
    Erfordert die Berechtigung 'DeviceManagementConfiguration.Read.All'.

.NOTES
    File Name: 21_Get-CompliancePolicies.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param()

Connect-MgGraph -Scopes "DeviceManagementConfiguration.Read.All"

$Policies = Get-MgDeviceManagementDeviceCompliancePolicy -All

Write-Host "Anzahl gefundener Policies: $($Policies.Count)" -ForegroundColor Cyan
$Policies | Select-Object DisplayName, Id, Description, CreatedDateTime | Format-Table -AutoSize
