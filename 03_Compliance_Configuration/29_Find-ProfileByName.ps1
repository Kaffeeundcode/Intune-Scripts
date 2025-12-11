<#
.SYNOPSIS
    Sucht ein Konfigurationsprofil nach Name.
    
.DESCRIPTION
    Hilft, die ID eines Profils zu finden, wenn man nur den Namen kennt.
    Erfordert die Berechtigung 'DeviceManagementConfiguration.Read.All'.

.NOTES
    File Name: 29_Find-ProfileByName.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [Parameter(Mandatory=$true)]
    [string]$ProfileName
)

Connect-MgGraph -Scopes "DeviceManagementConfiguration.Read.All"

$Profiles = Get-MgDeviceManagementDeviceConfiguration -Filter "startswith(displayName, '$ProfileName')"

if ($Profiles) {
    $Profiles | Select-Object DisplayName, Id, LastModifiedDateTime
} else {
    Write-Warning "Kein Profil gefunden."
}
