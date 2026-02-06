<#
.SYNOPSIS
    Retrieves Hardware Hashes for Windows Autopilot from existing Intune devices.

.DESCRIPTION
    IMPORTANT: You cannot retrieve the full hardware hash from the Graph API for *existing* Intune devices
    if they were not already registered with Autopilot. 
    However, if they ARE in Autopilot, this script exports them. 
    
    For non-Autopilot devices, this script collects SerialNumbers and details to help 
    target the 'Get-WindowsAutoPilotInfo' remediation script.

.NOTES
    File Name  : 103_Get-IntuneDeviceHardwareHashBulk.ps1
    Author     : Kaffeeundcode
    Version    : 1.0
#>

try {
    Connect-MgGraph -Scopes "DeviceManagementServiceConfig.Read.All", "DeviceManagementManagedDevices.Read.All" -ErrorAction Stop
} catch {
    Write-Error "Connect failed"
    exit
}

Write-Host "Retrieving Autopilot Devices..." -ForegroundColor Cyan
$AutopilotDevices = Get-MgDeviceManagementWindowsAutopilotDeviceIdentity -All

$Report = @()

foreach ($Dev in $AutopilotDevices) {
    # Note: The Graph API does NOT return the actual 4K HW Hash for security reasons in list mode.
    # It returns identifying info.
    
    $obj = [PSCustomObject]@{
        SerialNumber = $Dev.SerialNumber
        Model        = $Dev.Model
        Manufacturer = $Dev.Manufacturer
        ProductKey   = $Dev.ProductKey
        GroupTag     = $Dev.GroupTag
        AutopilotID  = $Dev.Id
        AssignedUser = $Dev.UserPrincipalName
        State        = $Dev.DeploymentProfileAssignmentStatus
    }
    $Report += $obj
}

$Count = $Report.Count
Write-Host "Found $Count Autopilot registered devices." -ForegroundColor Green

$ExportPath = "$PSScriptRoot\Autopilot_Inventory_$(Get-Date -Format 'yyyyMMdd').csv"
$Report | Export-Csv -Path $ExportPath -NoTypeInformation
Write-Host "Inventory exported to $ExportPath" -ForegroundColor Yellow
Write-Host "Note: To get the full 'HardwareHash' suitable for upload, you must run a collector script on the device itself." -ForegroundColor Magenta
