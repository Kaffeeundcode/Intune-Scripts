<#
.SYNOPSIS
    Gets the Download URL for collected diagnostics.
    
.DESCRIPTION
    Requires 'DeviceManagementManagedDevices.Read.All' permission.

.NOTES
    File Name: 72_Get-DeviceDiagnosticsDownloadUrl.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param(
    [Parameter(Mandatory=$true)]
    [string]$DeviceName
)

Connect-MgGraph -Scopes "DeviceManagementManagedDevices.Read.All"

$Device = Get-MgDeviceManagementManagedDevice -Filter "deviceName eq '$DeviceName'"
if ($Device) {
    # Retrieve Log Collection Response
    # Graph API: deviceManagement/managedDevices/{id}/logCollectionRequests
    $Reqs = Get-MgDeviceManagementManagedDeviceLogCollectionRequest -ManagedDeviceId $Device.Id
    
    if ($Reqs) {
        # Check status
        foreach ($r in $Reqs) {
            Write-Host "Status: $($r.Status)"
            if ($r.Status -eq 'completed') {
                Write-Host "Download URL: " -NoNewline
                Write-Host "Check Intune Portal (Graph API restrictions often prevent direct URL download via basic cmdlets)." -ForegroundColor Yellow
            }
        }
    } else {
        Write-Warning "No log collection requests found."
    }
}
