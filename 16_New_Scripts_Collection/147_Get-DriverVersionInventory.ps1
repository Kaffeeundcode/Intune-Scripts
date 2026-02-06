<#
.SYNOPSIS
    Exports driver versions for specific hardware components (e.g., Display, Net).

.DESCRIPTION
    Useful for compliance checking (e.g. "Do we have the bad Nvidia driver?").
    Queries Win32_PnPSignedDriver.

.NOTES
    File Name  : 147_Get-DriverVersionInventory.ps1
    Author     : Kaffeeundcode
    Version    : 1.0
#>

Param(
    [string]$DeviceClass = "Display" # Net, Media, System, etc.
)

$Drivers = Get-CimInstance -ClassName Win32_PnPSignedDriver | Where-Object { $_.DeviceClass -eq $DeviceClass }

$Report = @()

foreach ($D in $Drivers) {
    $Report += [PSCustomObject]@{
        DeviceName = $D.Description
        Manufacturer = $D.Manufacturer
        DriverVersion = $D.DriverVersion
        DriverDate = $D.DriverDate
        DeviceClass = $D.DeviceClass
    }
}

$Report | Format-Table DeviceName, DriverVersion, DriverDate -AutoSize
$Report | Export-Csv "$PSScriptRoot\Driver_Inventory_$DeviceClass.csv" -NoTypeInformation
