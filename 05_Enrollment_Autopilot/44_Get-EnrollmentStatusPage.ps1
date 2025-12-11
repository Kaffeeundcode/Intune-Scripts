<#
.SYNOPSIS
    Zeigt Konfigurationen der Enrollment Status Page (ESP).
    
.DESCRIPTION
    Ruft ESP-Profile ab.
    Erfordert die Berechtigung 'DeviceManagementConfiguration.Read.All'.

.NOTES
    File Name: 44_Get-EnrollmentStatusPage.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param()

Connect-MgGraph -Scopes "DeviceManagementConfiguration.Read.All"

# ESP is technically part of deviceManagement/deviceEnrollmentConfigurations (type windows10EnrollmentCompletionPageConfiguration)
Get-MgDeviceManagementDeviceEnrollmentConfiguration | Where-Object { $_.Displayname -like "*Status Page*" }
