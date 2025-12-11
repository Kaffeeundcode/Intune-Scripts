<#
.SYNOPSIS
    Setzt oder ändert den primären Benutzer eines Intune-Geräts.
    
.DESCRIPTION
    Aktualisiert die Referenz des primären Benutzers auf dem Gerät.
    Erfordert die Berechtigung 'DeviceManagementManagedDevices.ReadWrite.All'.
    Hinweis: Dies ist eine komplexe Operation, die das 'users/$ref' Endpoint manipuliert.

.NOTES
    File Name: 08_Set-DevicePrimaryUser.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [Parameter(Mandatory=$true)]
    [string]$DeviceName,

    [Parameter(Mandatory=$true)]
    [string]$UserPrincipalName
)

Connect-MgGraph -Scopes "DeviceManagementManagedDevices.ReadWrite.All", "User.Read.All"

$Device = Get-MgDeviceManagementManagedDevice -Filter "deviceName eq '$DeviceName'"
$User = Get-MgUser -UserId $UserPrincipalName

if ($Device -and $User) {
    # Remove existing user(s) - generic approach
    # In Graph SDK, setting primary user directly is via specific endpoint or by managing the reference
    # For simplicity in this generated script, we will use the Update-MgDevice... if users property is writable, 
    # but typically it requires DELETE/POST on the ref.
    
    # Using the /users/$ref endpoint logic is safer
    $Uri = "https://graph.microsoft.com/v1.0/deviceManagement/managedDevices('$($Device.Id)')/users/`$ref"
    $Body = @{
        "@odata.id" = "https://graph.microsoft.com/v1.0/users('$($User.Id)')"
    }

    try {
        Invoke-MgGraphRequest -Method POST -Uri $Uri -Body $Body
        Write-Host "Primärer Benutzer auf $($User.UserPrincipalName) gesetzt." -ForegroundColor Green
    } catch {
        Write-Error "Fehler beim Setzen des Benutzers: $_"
    }

} else {
    Write-Warning "Gerät oder Benutzer nicht gefunden."
}
