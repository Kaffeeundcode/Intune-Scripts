<#
.SYNOPSIS
    BitLocker-Recovery-Audit - Scans for devices missing BitLocker recovery keys in Entra ID.
    
.DESCRIPTION
    Iterates through managed devices and verifies if a recovery key is stored 
    in the cloud. Critical for preventing permanent data loss during hardware failure.
#>

[CmdletBinding()]
param ()

process {
    Write-Host "[INFO] Scanning for missing BitLocker recovery keys..." -ForegroundColor Cyan
    
    $Devices = Get-MgDeviceManagementManagedDevice -All
    $MissingKeys = @()

    foreach ($Device in $Devices) {
        # Check if the device has a recovery key associated (Simplified Graph check)
        try {
            $Keys = Get-MgDeviceManagementManagedDeviceBitLockerRecoveryKey -ManagedDeviceId $Device.Id -ErrorAction Stop
            if (-not $Keys) {
                $MissingKeys += $Device.DeviceName
            }
        } catch {
            $MissingKeys += "$($Device.DeviceName) (API Error)"
        }
    }

    if ($MissingKeys) {
        Write-Host "[ALERT] Found $($MissingKeys.Count) devices WITHOUT recovery keys in Entra ID!" -ForegroundColor Red
        $MissingKeys | ForEach-Object { Write-Host " - $_" -ForegroundColor Yellow }
    } else {
        Write-Host "[SUCCESS] All devices have recovery keys backed up." -ForegroundColor Green
    }
}