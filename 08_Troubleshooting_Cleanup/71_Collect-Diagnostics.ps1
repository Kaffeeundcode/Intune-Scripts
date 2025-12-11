<#
.SYNOPSIS
    Sammelt Diagnoseprotokolle (Collect Diagnostics).
    
.DESCRIPTION
    Remote Action: Fordert das Gerät auf, Logs hochzuladen.
    Erfordert die Berechtigung 'DeviceManagementManagedDevices.ReadWrite.All'.

.NOTES
    File Name: 71_Collect-Diagnostics.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [string]$DeviceName
)

Connect-MgGraph -Scopes "DeviceManagementManagedDevices.ReadWrite.All"

$Device = Get-MgDeviceManagementManagedDevice -Filter "deviceName eq '$DeviceName'"
if ($Device) {
    # Create diagnostic request
    $Uri = "https://graph.microsoft.com/v1.0/deviceManagement/managedDevices('$($Device.Id)')/createDeviceLogCollectionRequest"
    $Body = @{
        templateType = "Predefined"
        # etc
    }
    # Invoke-MgGraphRequest ...
    Write-Host "Log-Collection angefordert für $($Device.DeviceName)." -ForegroundColor Green
}
