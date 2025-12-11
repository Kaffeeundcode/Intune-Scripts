<#
.SYNOPSIS
    Cleans Up Stale Devices (> 90 Days).
    
.DESCRIPTION
    Retrieves and DELETES devices inactive for 90 days.
    Requires 'DeviceManagementManagedDevices.ReadWrite.All' permission.

.NOTES
    File Name: 75_Clean-StaleDevices.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param(
    [int]$Days = 90
)

Connect-MgGraph -Scopes "DeviceManagementManagedDevices.ReadWrite.All"

$Date = (Get-Date).AddDays(-$Days)
$Stale = Get-MgDeviceManagementManagedDevice -All | Where-Object { $_.LastSyncDateTime -lt $Date }

if ($Stale) {
    Write-Warning "Found $($Stale.Count) devices older than $Days days."
    $Stale | Select-Object DeviceName, LastSyncDateTime | Format-Table
    
    $Confirm = Read-Host "Type 'CLEANUP' to delete these devices permanently"
    if ($Confirm -eq 'CLEANUP') {
        foreach ($d in $Stale) {
            Write-Host "Deleting $($d.DeviceName)..."
            Remove-MgDeviceManagementManagedDevice -ManagedDeviceId $d.Id -ErrorAction SilentlyContinue
        }
        Write-Host "Cleanup complete." -ForegroundColor Green
    }
} else {
    Write-Host "No stale devices found."
}
