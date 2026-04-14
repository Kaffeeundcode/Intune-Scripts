<#
.SYNOPSIS
    Deep dive into Teams Devices (Rooms, Panels, Phones) health.

.DESCRIPTION
    Lists all provisioned Teams devices and checks their health status:
    - Software version
    - Network connectivity
    - Peripherals status (Camera/Mic)
    
    Useful for MTR (Microsoft Teams Room) fleet management.

.NOTES
    File Name  : 140_Get-TeamsDeviceHealthDetailed.ps1
    Author     : Kaffeeundcode
    Version    : 1.0
#>

try {
    Connect-MgGraph -Scopes "TeamworkDevice.Read.All" -ErrorAction Stop
} catch {
    Write-Error "Login failed"
    exit
}

Write-Host "Fetching Teams Devices (MTRs, Phones)..." -ForegroundColor Cyan
$Devices = Get-MgTeamworkDevice -All -ExpandProperty "health"

$Report = @()

foreach ($Dev in $Devices) {
    $H = $Dev.Health
    
    $obj = [PSCustomObject]@{
        Name = $Dev.ActivityState
        Type = $Dev.DeviceType
        Manufacturer = $Dev.HardwareDetail.Manufacturer
        Model = $Dev.HardwareDetail.Model
        HealthStatus = $Dev.HealthStatus
        SoftwareFreshness = $H.SoftwareSubscriptionStatus
        Network = $H.NetworkHealth.ConnectionStatus
        LastSeen = $Dev.LastModifiedDateTime
    }
    $Report += $obj
}

$Report | Sort-Object LastSeen -Descending | Format-Table Type, Model, HealthStatus, Network -AutoSize
$Report | Export-Csv "$PSScriptRoot\TeamsDevices_Health.csv" -NoTypeInformation
Write-Host "Done." -ForegroundColor Green
