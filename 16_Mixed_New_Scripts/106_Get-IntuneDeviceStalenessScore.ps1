<#
.SYNOPSIS
    Calculates a "Staleness Score" for devices to help identify candidates for cleanup.

.DESCRIPTION
    Devices are scored based on:
    - Last Check-in date (More than 30/60/90 days)
    - OS Version Lag (Is it an old build?)
    - Compliance State
    
    A high score indicates a device that is likely abandoned or broken.

.NOTES
    File Name  : 106_Get-IntuneDeviceStalenessScore.ps1
    Author     : Kaffeeundcode
    Version    : 1.0
#>

try {
    Connect-MgGraph -Scopes "DeviceManagementManagedDevices.Read.All" -ErrorAction Stop
} catch {
    Write-Error "Login failed"
    exit
}

$Devices = Get-MgDeviceManagementManagedDevice -All

$Report = @()
$Today = Get-Date

foreach ($Dev in $Devices) {
    [int]$Score = 0
    $Issues = @()

    # Factor 1: Check-in Time
    if ($Dev.LastSyncDateTime) {
        $DaysSinceSync = ($Today - $Dev.LastSyncDateTime).Days
        if ($DaysSinceSync -gt 90) { $Score += 50; $Issues += "Sync > 90 days" }
        elseif ($DaysSinceSync -gt 60) { $Score += 30; $Issues += "Sync > 60 days" }
        elseif ($DaysSinceSync -gt 30) { $Score += 10; $Issues += "Sync > 30 days" }
    } else {
        $Score += 100; $Issues += "Never Synced"
    }

    # Factor 2: Compliance
    if ($Dev.ComplianceState -ne "compliant") {
        $Score += 20; $Issues += "Not Compliant"
    }

    # Factor 3: OS Version (Simplified check for old Win10)
    # E.g. anything starting with 10.0.1 (Old builds) vs 10.0.2 (Newer)
    if ($Dev.OperatingSystem -eq "Windows" -and $Dev.OperatingSystemVersion -match "^10\.0\.1[0-8]") {
         $Score += 15; $Issues += "Old OS Build"
    }

    $obj = [PSCustomObject]@{
        DeviceName    = $Dev.DeviceName
        User          = $Dev.UserPrincipalName
        Score         = $Score
        LastSyncDays  = $DaysSinceSync
        Issues        = ($Issues -join ", ")
        Compliance    = $Dev.ComplianceState
        Id            = $Dev.Id
    }
    $Report += $obj
}

$Sorted = $Report | Sort-Object Score -Descending
$Sorted | Select-Object -First 20 | Format-Table DeviceName, Score, LastSyncDays, Issues -AutoSize

$Path = "$PSScriptRoot\Device_Staleness_Score.csv"
$Sorted | Export-Csv -Path $Path -NoTypeInformation
Write-Host "Full report exported to $Path" -ForegroundColor Green
