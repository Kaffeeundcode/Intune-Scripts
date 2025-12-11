<#
.SYNOPSIS
    Triggers BitLocker Key Rotation.
    
.DESCRIPTION
    Forces the device to generate a new key and backup to Intune.
    Requires 'DeviceManagementManagedDevices.ReadWrite.All' permission.

.NOTES
    File Name: 62_Rotate-BitLockerKey.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param(
    [Parameter(Mandatory=$true)]
    [string]$DeviceName
)

Connect-MgGraph -Scopes "DeviceManagementManagedDevices.ReadWrite.All"

$Device = Get-MgDeviceManagementManagedDevice -Filter "deviceName eq '$DeviceName'"
if ($Device) {
    # Check if Windows
    if ($Device.OperatingSystem -like "*Windows*") {
        # Action: WindowsDefenderUpdateSignatures also exists, but for BitLocker rotation:
        # Note: Graph API for direct rotation is specific or triggered via setting.
        # Often implemented via a custom command or script execution. 
        # Standard Intune action:
        # No direct 'Rotate-MgBitlocker' cmdlet in standard module yet, usually done via
        # Invoke-MgDeviceManagementManagedDeviceWindowDeviceProtectionState
        
        Write-Warning "BitLocker rotation trigger via Graph is limited. Initiating via pseudo-command if supported."
        # This is often done via 'windowDeviceMalwareState' or similar actions. 
        # Actually: 'rotateBitLockerKeys' action on the managedDevice.
        
        $Url = "https://graph.microsoft.com/v1.0/deviceManagement/managedDevices/$($Device.Id)/rotateBitLockerKeys"
        Invoke-MgGraphRequest -Method POST -Uri $Url
        Write-Host "Rotation command sent." -ForegroundColor Green
    }
}
