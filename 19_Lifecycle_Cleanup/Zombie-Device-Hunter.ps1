<#
.SYNOPSIS
    Zombie-Device-Hunter - Identifies and manages stale devices in Intune.
    
.DESCRIPTION
    Implements a 3-stage lifecycle process for inactive devices:
    Stage 1 (Detect): Find devices not synced for X days.
    Stage 2 (Warn): Mark for communication/notification.
    Stage laSt (Purge): Identify candidates for deletion.
#>

[CmdletBinding()]
param (
    [Parameter(Mandatory=$false)]
    [int]$InactivityDays = 90,

    [Parameter(Mandatory=$false)]
    [ValidateSet('Detect', 'Warn', 'Purge')]
    [string]$Stage = 'Detect'
)

process {
    $CutoffDate = (Get-Date).AddDays(-$InactivityDays).ToString("yyyy-MM-ddTHH:mm:ssZ")
    Write-Host "[INFO] Scanning for zombie devices (Inactive since $CutoffDate)..." -ForegroundColor Cyan
    
    $Zombies = Get-MgDeviceManagementManagedDevice -Filter "lastSyncDateTime lt $CutoffDate" -All

    if (-not $Zombies) {
        Write-Host "[SUCCESS] No zombie devices detected." -ForegroundColor Green
        return
    }

    Write-Host "[ALERT] Found $($Zombies.Count) zombie devices." -ForegroundColor Yellow

    switch ($Stage) {
        'Detect' {
            $Zombies | Select-Object DeviceName, UserPrincipalName, LastSyncDateTime | Format-Table
        }
        'Warn' {
            Write-Host "[ACTION] Generating warning list for communication..." -ForegroundColor Gray
            $Zombies | Select-Object UserPrincipalName, DeviceName | Export-Csv -Path "Zombie_Warning_List.csv" -NoTypeInformation
            Write-Host "[SUCCESS] Warning list exported to Zombie_Warning_List.csv" -ForegroundColor Green
        }
        'Purge' {
            Write-Host "[DANGER] Identifying devices for permanent deletion..." -ForegroundColor Red
            # In a real scenario, this would trigger Remove-MgDeviceManagementManagedDevice
            $Zombies | Select-Object DeviceName, Id | Format-Table
            Write-Host "[INFO] PLEASE REVIEW LIST BEFORE RUNNING DELETE COMMANDS." -ForegroundColor Yellow
        }
    }
}