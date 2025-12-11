<#
.SYNOPSIS
    Ruft detaillierte Informationen zu einem Gerät ab.
    
.DESCRIPTION
    Liest erweiterte Eigenschaften wie OS-Version, Serialnummer, Eigentümerschaft und Compliance-Details aus.
    Gibt ein benutzerdefiniertes Objekt zurück.
    Erfordert die Berechtigung 'DeviceManagementManagedDevices.Read.All'.

.NOTES
    File Name: 05_Get-IntuneDeviceDetails.ps1
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
    [PSCustomObject]@{
        Name          = $Device.DeviceName
        Id            = $Device.Id
        OS            = $Device.OperatingSystem
        OSVersion     = $Device.OsVersion
        SerialNumber  = $Device.SerialNumber
        Compliance    = $Device.ComplianceState
        LastSync      = $Device.LastSyncDateTime
        PrimaryUser   = $Device.Users.UserPrincipalName -join ", "
        IsEncrypted   = $Device.IsEncrypted
    }
} else {
    Write-Warning "Gerät nicht gefunden."
}
