<#
.SYNOPSIS
    Lists recent Enrollment Failures.
    
.DESCRIPTION
    Retrieves enrollment troubleshooting info.
    Requires 'DeviceManagementServiceConfig.Read.All' permission.

.NOTES
    File Name: 49_Get-EnrollmentFailures.ps1
    Author: Kaffee & Code Assistant
    Version: 1.0
#>

param()

Connect-MgGraph -Scopes "DeviceManagementServiceConfig.Read.All"

# Reporting/Troubleshooting call - simplified to accessing deviceManagement/deviceEnrollmentConfigurations usually does NOT show logs.
# We use the deviceManagement/enrollmentTroubleshootingEvents if available or audit logs.
# Using 'Get-MgDeviceManagementEnrollmentTroubleshootingEvent'

$Events = Get-MgDeviceManagementEnrollmentTroubleshootingEvent -Top 20 -Sort "logCollectionDateTime desc"

if ($Events) {
    $Events | Select-Object EnrollmentType, FailureCategory, FailureReason, LogCollectionDateTime | Format-Table
} else {
    Write-Host "No recent enrollment failure events found."
}
