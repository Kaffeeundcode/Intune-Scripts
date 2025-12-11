<#
.SYNOPSIS
    Ruft den Installationsstatus von Apps für ein bestimmtes Gerät ab.
    
.DESCRIPTION
    Zeigt an, welche Apps auf einem Gerät installiert sind, fehlgeschlagen sind oder ausstehen.
    Erfordert die Berechtigung 'DeviceManagementApps.Read.All'.

.NOTES
    File Name: 18_Get-DeviceAppInstallStatus.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [Parameter(Mandatory=$true)]
    [string]$DeviceName
)

Connect-MgGraph -Scopes "DeviceManagementApps.Read.All", "DeviceManagementManagedDevices.Read.All"

$Device = Get-MgDeviceManagementManagedDevice -Filter "deviceName eq '$DeviceName'"

if ($Device) {
    # This queries the deviceAppManagement statuses. Note: Logic might need specific expanding depending on needs.
    # We use a broad approach here.
    $Statuses = Get-MgDeviceAppMgtMobileAppDeviceStatus -Filter "deviceDisplayName eq '$DeviceName'"
    
    if ($Statuses) {
        $Statuses | Select-Object MobileAppDisplayName, InstallState, InstallStateDetail, LastStatusChangeDateTime | Format-Table -AutoSize
    } else {
        Write-Warning "Keine App-Status für dieses Gerät gefunden."
    }
} else {
    Write-Warning "Gerät nicht gefunden."
}
