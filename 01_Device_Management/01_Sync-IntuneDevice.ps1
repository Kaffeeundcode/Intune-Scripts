<#
.SYNOPSIS
    Triggers a manual sync for a specific Intune Managed Device.
    
.DESCRIPTION
    This script connects to Microsoft Graph and triggers a sync action for a device specified by its Device Name or ID.
    Requires 'DeviceManagementManagedDevices.ReadWrite.All' permission.

.NOTES
    File Name: 01_Sync-IntuneDevice.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [Parameter(Mandatory=$true, HelpMessage="The name of the device to sync")]
    [string]$DeviceName
)

# Connect to Microsoft Graph
try {
    Connect-MgGraph -Scopes "DeviceManagementManagedDevices.ReadWrite.All" -ErrorAction Stop
    Write-Host "Connected to Microsoft Graph successfully." -ForegroundColor Green
}
catch {
    Write-Error "Failed to connect to Microsoft Graph. Please ensure the module is installed (Install-Module Microsoft.Graph)."
    exit
}

# Get Device
$Device = Get-MgDeviceManagementManagedDevice -Filter "deviceName eq '$DeviceName'" -ErrorAction SilentlyContinue

if ($null -eq $Device) {
    Write-Warning "Device '$DeviceName' not found."
    exit
}

# Trigger Sync
try {
    Sync-MgDeviceManagementManagedDevice -ManagedDeviceId $Device.Id -ErrorAction Stop
    Write-Host "Sync action triggered successfully for device: $($Device.DeviceName) ($($Device.Id))" -ForegroundColor Green
}
catch {
    Write-Error "Failed to trigger sync: $_"
}
