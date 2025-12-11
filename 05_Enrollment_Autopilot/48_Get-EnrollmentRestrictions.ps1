<#
.SYNOPSIS
    Listet Einschränkungen für die Geräteregistrierung auf (Enrollment Restrictions).
    
.DESCRIPTION
    Zeigt, welche Plattformen und Versionen blockiert oder erlaubt sind.
    Erfordert die Berechtigung 'DeviceManagementConfiguration.Read.All'.

.NOTES
    File Name: 48_Get-EnrollmentRestrictions.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param()

Connect-MgGraph -Scopes "DeviceManagementConfiguration.Read.All"

Get-MgDeviceManagementDeviceEnrollmentConfiguration | Where-Object { $_.DeviceEnrollmentConfigurationType -match "limit|platformRestriction" } | Format-Table DisplayName, DeviceEnrollmentConfigurationType, LastModifiedDateTime
