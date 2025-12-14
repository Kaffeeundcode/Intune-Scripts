<#
.SYNOPSIS
    Listet Nutzungsbedingungen (Terms and Conditions) auf.
    
.DESCRIPTION
    Zeigt alle T&C Policies im Tenant an.
    Erfordert die Berechtigung 'DeviceManagementConfiguration.Read.All'.

.NOTES
    File Name: 149_Get-TermsAndConditions.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param()

Connect-MgGraph -Scopes "DeviceManagementConfiguration.Read.All"
Get-MgDeviceManagementTermAndCondition | Select-Object DisplayName, CreatedDateTime
