<#
.SYNOPSIS
    Zeigt Details zur Compliance eines bestimmten Geräts.
    
.DESCRIPTION
    Listet auf, welche Compliance-Policies auf das Gerät angewendet wurden und deren Status (Success/Error/NonCompliant).
    Erfordert die Berechtigung 'DeviceManagementManagedDevices.Read.All'.

.NOTES
    File Name: 27_Get-DeviceComplianceDetails.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [Parameter(Mandatory=$true)]
    [string]$DeviceName
)

Connect-MgGraph -Scopes "DeviceManagementManagedDevices.Read.All"

$Device = Get-MgDeviceManagementManagedDevice -Filter "deviceName eq '$DeviceName'"
if (!$Device) { Write-Warning "Gerät nicht gefunden"; exit }

# Get policy states for this device
$States = Get-MgDeviceManagementManagedDeviceDeviceCompliancePolicyState -ManagedDeviceId $Device.Id

$States | Select-Object DisplayName, State, SettingCount | Format-Table -AutoSize
