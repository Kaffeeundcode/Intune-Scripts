<#
.SYNOPSIS
    Gets Microsoft Defender Status for a Device.
    
.DESCRIPTION
    Checks if Defender is active and signature version.
    Requires 'DeviceManagementManagedDevices.Read.All' permission.

.NOTES
    File Name: 63_Get-DefenderStatus.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param(
    [Parameter(Mandatory=$true)]
    [string]$DeviceName
)

Connect-MgGraph -Scopes "DeviceManagementManagedDevices.Read.All"

$Device = Get-MgDeviceManagementManagedDevice -Filter "deviceName eq '$DeviceName'"

if ($Device) {
    # Defender status is often in 'deviceHealth' or 'windowsProtectionState'
    # We query the windowsProtectionState navigation property if possible.
    
    $State = Get-MgDeviceManagementManagedDeviceWindowsProtectionState -ManagedDeviceId $Device.Id
    if ($State) {
        $State | Select-Object AntiMalwareVersion, SignatureVersion, DeviceHealthStatus | Format-List
    } else {
        Write-Host "No Windows Protection State available."
    }
}
