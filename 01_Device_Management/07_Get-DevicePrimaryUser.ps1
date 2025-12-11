<#
.SYNOPSIS
    Ermittelt den primären Benutzer eines Intune-Geräts.
    
.DESCRIPTION
    Ruft den Benutzer ab, der als primärer Nutzer (Primary User) für das Gerät assoziiert ist.
    Erfordert die Berechtigung 'DeviceManagementManagedDevices.Read.All'.

.NOTES
    File Name: 07_Get-DevicePrimaryUser.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [Parameter(Mandatory=$true)]
    [string]$DeviceName
)

Connect-MgGraph -Scopes "DeviceManagementManagedDevices.Read.All"

$Device = Get-MgDeviceManagementManagedDevice -Filter "deviceName eq '$DeviceName'" -ExpandProperty "users"

if ($Device) {
    $PrimaryUser = $Device.Users | Where-Object { $_.Id -eq $Device.UserId } # Simplification, typically primary user is in the users list
    if ($Device.Users) {
        Write-Host "Verbundene Benutzer für $($Device.DeviceName):"
        $Device.Users | ForEach-Object {
            Write-Host " - $($_.UserPrincipalName) (ID: $($_.Id))"
        }
    } else {
        Write-Warning "Keine Benutzer verknüpft."
    }
} else {
    Write-Warning "Gerät nicht gefunden."
}
