<#
.SYNOPSIS
    Lists Enrollment Restriction Policies.
    
.DESCRIPTION
    Shows device type restrictions and platform limits.
    Requires 'DeviceManagementConfiguration.Read.All' permission.

.NOTES
    File Name: 48_Get-EnrollmentRestrictions.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param()

Connect-MgGraph -Scopes "DeviceManagementConfiguration.Read.All"

# Enrollment Restrictions are Device Enrollment Configurations of specific types
$Restrictions = Get-MgDeviceManagementDeviceEnrollmentConfiguration -Filter "isof('microsoft.graph.deviceEnrollmentPlatformRestrictionsConfiguration') or isof('microsoft.graph.deviceEnrollmentLimitConfiguration')"

if ($Restrictions) {
    $Restrictions | Select-Object DisplayName, Id, '@odata.type', Priority | Format-Table
} else {
    Write-Host "No restriction policies found."
}
