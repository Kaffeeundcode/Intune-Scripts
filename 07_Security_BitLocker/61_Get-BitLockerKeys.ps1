<#
.SYNOPSIS
    Ruft den BitLocker Recovery Key für ein Gerät ab.
    
.DESCRIPTION
    Liest den 48-stelligen Wiederherstellungsschlüssel aus Azure AD / Intune.
    Erfordert die Berechtigung 'BitlockerKey.Read.All'.

.NOTES
    File Name: 61_Get-BitLockerKeys.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [Parameter(Mandatory=$true)]
    [string]$DeviceName
)

Connect-MgGraph -Scopes "BitlockerKey.Read.All", "DeviceManagementManagedDevices.Read.All"

$Device = Get-MgDeviceManagementManagedDevice -Filter "deviceName eq '$DeviceName'"
if (!$Device) { Write-Warning "Gerät nicht gefunden"; exit }

# BitLocker keys are stored in AAD (InformationProtection).
# We search by DeviceId (Azure AD Device ID, not Intune ID).
$Keys = Get-MgInformationProtectionBitlockerRecoveryKey -Filter "deviceId eq '$($Device.AzureAdDeviceId)'"

if ($Keys) {
    Write-Host "Schlüssel für $($Device.DeviceName):" -ForegroundColor Green
    $Keys | Select-Object CreatedDateTime, Key, VolumeType | Format-Table -AutoSize
} else {
    Write-Warning "Keine BitLocker Keys gefunden."
}
