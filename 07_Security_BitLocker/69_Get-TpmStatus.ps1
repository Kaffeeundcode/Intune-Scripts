<#
.SYNOPSIS
    Prüft TPM Informationen (über Hardware-Inventar).
    
.DESCRIPTION
    Versucht, TPM-Version und Status aus den Hardwareinformationen zu lesen.
    Erfordert die Berechtigung 'DeviceManagementManagedDevices.Read.All'.

.NOTES
    File Name: 69_Get-TpmStatus.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [string]$DeviceName
)

Connect-MgGraph -Scopes "DeviceManagementManagedDevices.Read.All"

$Device = Get-MgDeviceManagementManagedDevice -Filter "deviceName eq '$DeviceName'" -ExpandProperty "hardwareInformation"

if ($Device) {
    Write-Host "TPM Spezifikation: $($Device.HardwareInformation.TpmSpecificationVersion)"
}
