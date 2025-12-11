<#
.SYNOPSIS
    Exports specific Intune Configuration to JSON.
    
.DESCRIPTION
    Dumps a Policy object to JSON for version control.
    
.NOTES
    File Name: 85_Export-IntuneJSON.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param(
    [string]$PolicyId
)

Connect-MgGraph -Scopes "DeviceManagementConfiguration.Read.All"

$Policy = Get-MgDeviceManagementDeviceCompliancePolicy -DeviceCompliancePolicyId $PolicyId
if ($Policy) {
    $Policy | ConvertTo-Json -Depth 5
}
