<#
.SYNOPSIS
    Lists all Compliance Policies.
    
.DESCRIPTION
    Retrieves a list of all Device Compliance Policies configured in Intune.
    Requires 'DeviceManagementConfiguration.Read.All' permission.

.NOTES
    File Name: 21_Get-CompliancePolicies.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param()

Connect-MgGraph -Scopes "DeviceManagementConfiguration.Read.All"

$Policies = Get-MgDeviceManagementDeviceCompliancePolicy -All

if ($Policies) {
    $Policies | Select-Object DisplayName, Id, '@odata.type', LastModifiedDateTime | Format-Table -AutoSize
    Write-Host "Total Policies: $($Policies.Count)" -ForegroundColor Green
} else {
    Write-Warning "No compliance policies found."
}
