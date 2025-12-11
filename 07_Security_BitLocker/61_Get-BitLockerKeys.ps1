<#
.SYNOPSIS
    Retrieves BitLocker Recovery Keys for a Device.
    
.DESCRIPTION
    Requires 'BitlockerKey.Read.All' permission.

.NOTES
    File Name: 61_Get-BitLockerKeys.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param(
    [Parameter(Mandatory=$true)]
    [string]$DeviceName
)

Connect-MgGraph -Scopes "BitlockerKey.Read.All", "DeviceManagementManagedDevices.Read.All"

$Device = Get-MgDeviceManagementManagedDevice -Filter "deviceName eq '$DeviceName'"
if (-not $Device) { Write-Error "Device not found"; exit }

# BitLocker keys are often associated via the device ID or registered via Azure AD device ID.
# Graph call: informationProtection/bitlocker/recoveryKeys

$Keys = Get-MgInformationProtectionBitlockerRecoveryKey -Filter "deviceId eq '$($Device.AzureAdDeviceId)'"

if ($Keys) {
    foreach ($k in $Keys) {
        Write-Host "Key ID: $($k.Id)"
        # The actual key content (password) requires showing the full property or a specific call to reveal it
        # $Details = Get-MgInformationProtectionBitlockerRecoveryKey -BitlockerRecoveryKeyId $k.Id -Property "key"
        Write-Host "Recovery Key: $($k.Key)" -ForegroundColor Green
        Write-Host "Volume Type: $($k.VolumeType)"
        Write-Host "---"
    }
} else {
    Write-Warning "No BitLocker keys found for this device."
}
