<#
.SYNOPSIS
    Forces Intune Sync from the Client Side (Windows).
    
.DESCRIPTION
    Intended to be run locally on a Windows device.
    
.NOTES
    File Name: 74_Force-IntuneSync_ClientSide.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

Write-Host "Triggering MDM Sync..."

# Method 1: DeviceEnroller.exe
$EnrollerPath = "$env:SystemRoot\system32\deviceenroller.exe"
if (Test-Path $EnrollerPath) {
    Start-Process $EnrollerPath -ArgumentList "/o", "/c", "/b" -Wait
    Write-Host "Sync triggered via DeviceEnroller." -ForegroundColor Green
} else {
    Write-Warning "DeviceEnroller.exe not found."
}

# Method 2: Scheduled Task
Get-ScheduledTask | Where-Object {$_.TaskName -like "*PushLaunch*"} | Start-ScheduledTask
