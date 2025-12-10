<#
.SYNOPSIS
    Gets Devices owned by a User.
    
.DESCRIPTION
    Lists managed devices where the user is the owner/primary.
    Requires 'User.Read.All' permission.

.NOTES
    File Name: 39_Get-UserDevices.ps1
    Author: Kaffee & Code Assistant
    Version: 1.0
#>

param(
    [Parameter(Mandatory=$true)]
    [string]$UserPrincipalName
)

Connect-MgGraph -Scopes "User.Read.All", "Device.Read.All"

$User = Get-MgUser -UserId $UserPrincipalName
$Devices = Get-MgUserOwnedDevice -UserId $User.Id

if ($Devices) {
    $Devices | Select-Object DisplayName, DeviceId, OperatingSystem, ApproximateLastSignInDateTime | Format-Table
} else {
    Write-Host "No registered devices found for this user."
}
