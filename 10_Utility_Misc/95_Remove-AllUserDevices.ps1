<#
.SYNOPSIS
    Removes ALL devices for a specific user.
    
.DESCRIPTION
    DANGER: Wipes/Deletes all devices owned by a user (e.g. leaver).
    
.NOTES
    File Name: 95_Remove-AllUserDevices.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param(
    [Parameter(Mandatory=$true)]
    [string]$UserPrincipalName,
    
    [switch]$WhatIf
)

Connect-MgGraph -Scopes "DeviceManagementManagedDevices.ReadWrite.All", "User.Read.All"

$User = Get-MgUser -UserId $UserPrincipalName
$Devices = Get-MgUserOwnedDevice -UserId $User.Id

foreach ($d in $Devices) {
    if ($WhatIf) {
        Write-Host "Would delete: $($d.Id)"
    } else {
        # Cast to managed device needed usually
        Remove-MgDeviceManagementManagedDevice -ManagedDeviceId $d.Id -ErrorAction SilentlyContinue
        Write-Host "Deleted $($d.Id)" -ForegroundColor Red
    }
}
