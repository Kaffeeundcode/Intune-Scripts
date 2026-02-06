<#
.SYNOPSIS
    Parses local Intune Management Extension logs to analyze script execution times.

.DESCRIPTION
    Designed to run LOCALLY on a client.
    Reads 'IntuneManagementExtension.log' and extracts script execution events.
    Calculates how long each remediation/script took to run.

.NOTES
    File Name  : 142_Get-ScriptExecutionTelemetry.ps1
    Author     : Kaffeeundcode
    Version    : 1.0
#>

$LogPath = "$env:ProgramData\Microsoft\IntuneManagementExtension\Logs\IntuneManagementExtension.log"

if (-not (Test-Path $LogPath)) {
    Write-Error "Log file not found at $LogPath"
    exit
}

Write-Host "Reading log..." -ForegroundColor Cyan

# Simple regex parsing for script start/end (simplified)
# Pattern: "Processing User/Device Script... PolicyId: X"
# Find Start/End pairs is complex with regex.

# We will search for 'Script execution returned' which usually has the duration.
$Lines = Select-String -Path $LogPath -Pattern "Script execution returned" -Context 0,0

$Report = @()

foreach ($Match in $Lines) {
    # Line Ex: "Script execution returned: 0, execution time: 15403 ms"
    $Line = $Match.Line
    if ($Line -match "execution time:\s*(\d+)") {
        $Time = $matches[1]
        
        $Report += [PSCustomObject]@{
            TimeStamp = $Line.Split(" ")[1] # Date logic needed
            DurationMS = $Time
            RawLine = $Line
        }
    }
}

$Report | Format-Table DurationMS, TimeStamp -AutoSize
Write-Host "Found $($Report.Count) execution events." -ForegroundColor Green
