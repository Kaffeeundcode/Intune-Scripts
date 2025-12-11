<#
.SYNOPSIS
    Aktualisiert Defender-Signaturen (Remote Action).
    
.DESCRIPTION
    Sendet den Befehl zum Signatur-Update an das Gerät.
    Erfordert die Berechtigung 'DeviceManagementManagedDevices.ReadWrite.All'.

.NOTES
    File Name: 64_Update-DefenderSignatures.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [string]$DeviceName
)

Connect-MgGraph -Scopes "DeviceManagementManagedDevices.ReadWrite.All"

$Device = Get-MgDeviceManagementManagedDevice -Filter "deviceName eq '$DeviceName'"
if ($Device) {
    Invoke-MgWindowsDefenderUpdateSignaturesDeviceManagementManagedDevice -ManagedDeviceId $Device.Id
    Write-Host "Signature-Update ausgelöst." -ForegroundColor Green
}
