<#
.SYNOPSIS
    Listet alle Geräte eines Benutzers auf.
    
.DESCRIPTION
    Ruft alle Managed Devices ab, die einem bestimmten Benutzer zugeordnet sind.
    Erfordert die Berechtigung 'DeviceManagementManagedDevices.Read.All'.

.NOTES
    File Name: 39_Get-UserDevices.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [Parameter(Mandatory=$true)]
    [string]$UserPrincipalName
)

Connect-MgGraph -Scopes "DeviceManagementManagedDevices.Read.All"

$Devices = Get-MgDeviceManagementManagedDevice -Filter "userPrincipalName eq '$UserPrincipalName'"

if ($Devices) {
    $Devices | Select-Object DeviceName, OperatingSystem, ComplianceState
} else {
    Write-Warning "Keine Geräte für diesen Benutzer gefunden."
}
