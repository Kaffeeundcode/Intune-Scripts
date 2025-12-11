<#
.SYNOPSIS
    Checks Autopilot Requirements (Client Side).
    
.DESCRIPTION
    Checks TPM, Network, OS Version. Run locally.

.NOTES
    File Name: 77_Check-AutopilotPrerequisites.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

Write-Host "Checking Autopilot Prerequisites..." -ForegroundColor Cyan

# 1. TPM
$Tpm = Get-Tpm
Write-Host "TPM Present: $($Tpm.TpmPresent)"
Write-Host "TPM Ready: $($Tpm.TpmReady)"

# 2. OS Info
$Info = Get-ComputerInfo
Write-Host "OS Version: $($Info.OsName) - $($Info.OsVersion)"

# 3. Connection
$Ping = Test-Connection "ztd.dds.microsoft.com" -Count 1 -Quiet
Write-Host "Autopilot URL Reachable: $Ping"
