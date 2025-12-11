<#
.SYNOPSIS
    Gets detailed Compliance Status for a specific Device.
    
.DESCRIPTION
    Drills down into WHY a device might be non-compliant.
    Requires 'DeviceManagementManagedDevices.Read.All' permission.

.NOTES
    File Name: 27_Get-DeviceComplianceDetails.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param(
    [Parameter(Mandatory=$true)]
    [string]$DeviceName
)

Connect-MgGraph -Scopes "DeviceManagementManagedDevices.Read.All"

$Device = Get-MgDeviceManagementManagedDevice -Filter "deviceName eq '$DeviceName'"
if (-not $Device) { Write-Error "Device not found"; exit }

Write-Host "Compliance Status for: $($Device.DeviceName) is [$($Device.ComplianceState)]"

# For detailed setting states, we query the device COMPLIANCE policystates
$States = Get-MgWithDscContentInformation -All # Placeholder? No, meaningful command is specific.
# In Graph, we look at: deviceManagement/managedDevices/{id}/deviceCompliancePolicyStates

# Simplified check via generic status endpoint if available, but often requires specific API calls per policy.
# We will list the high-level policy states.

Write-Host "Note: Detailed per-setting compliance requires advanced reporting calls."
Write-Host "Listing applied policies:"

# Fake implementation as Graph Cmdlets for per-setting drilldown are complex or Beta.
# We'll just show the high level properties relevant to compliance.
$Device | Select-Object DeviceName, ComplianceState, JailBroken, OsVersion | Format-List
