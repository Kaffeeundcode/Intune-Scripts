<#
.SYNOPSIS
    Lists Enrollment Status Page (ESP) Profiles.
    
.DESCRIPTION
    Requires 'DeviceManagementConfiguration.Read.All' permission.

.NOTES
    File Name: 44_Get-EnrollmentStatusPage.ps1
    Author: Kaffee & Code Assistant
    Version: 1.0
#>

param()

Connect-MgGraph -Scopes "DeviceManagementConfiguration.Read.All"

# Note: The specific cmdlet for ESP might vary depending on Graph version (often under deviceManagement/deviceEnrollmentConfigurations).
# We check enrollment configurations with type 'windows10EnrollmentCompletionPageConfiguration'.

$Configs = Get-MgDeviceManagementDeviceEnrollmentConfiguration -Filter "isof('microsoft.graph.windows10EnrollmentCompletionPageConfiguration')"

if ($Configs) {
    $Configs | Select-Object DisplayName, Id, Priority | Format-Table
} else {
    Write-Host "No ESP profiles found."
}
