<#
.SYNOPSIS
    Listet Device Enrollment Profile auf.
    
.DESCRIPTION
    Zeigt Profile für DEP (Apple) oder Corporate Owned Devices.
    Erfordert die Berechtigung 'DeviceManagementServiceConfig.Read.All'.

.NOTES
    File Name: 141_Get-DeviceEnrollmentProfile.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param()

Connect-MgGraph -Scopes "DeviceManagementServiceConfig.Read.All"
Get-MgDeviceManagementDepOnboardingSetting
