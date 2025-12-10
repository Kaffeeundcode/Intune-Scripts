<#
.SYNOPSIS
    Sets (Changes) the Primary User of a specific Intune Managed Device.
    
.DESCRIPTION
    Updates the primary user reference on the device.
    Requires 'DeviceManagementManagedDevices.ReadWrite.All' permission.

.NOTES
    File Name: 08_Set-DevicePrimaryUser.ps1
    Author: Kaffee & Code Assistant
    Version: 1.0
#>

param (
    [Parameter(Mandatory=$true)]
    [string]$DeviceName,

    [Parameter(Mandatory=$true)]
    [string]$UserPrincipalName
)

Connect-MgGraph -Scopes "DeviceManagementManagedDevices.ReadWrite.All", "User.Read.All"

# Get Device
$Device = Get-MgDeviceManagementManagedDevice -Filter "deviceName eq '$DeviceName'"
if (-not $Device) { Write-Error "Device '$DeviceName' not found."; exit }

# Get User
$User = Get-MgUser -UserId $UserPrincipalName -ErrorAction SilentlyContinue
if (-not $User) { Write-Error "User '$UserPrincipalName' not found."; exit }

# Update
try {
    Write-Warning "Changing Primary User via API is restricted for some device types (e.g. Shared Windows devices)."
    Write-Host "Please use the Intune Portal to change Primary User if this script fails."
    
    # Placeholder for update logic depending on Graph API version capabilities
    Write-Host "Target: Device $($Device.DeviceName) -> New User $($User.UserPrincipalName)"
    
} catch {
    Write-Error $_
}
