<#
.SYNOPSIS
    Restarts Intune Management Extension Service (Client Side).
    
.DESCRIPTION
    This script is intended to be DEPLOYED as a PowerShell script to devices, 
    or run locally on a client, not via Graph API.
    
.NOTES
    File Name: 73_Restart-IntuneManagementExtension.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

Write-Host "Restarting Intune Management Extension..."
$Service = Get-Service -Name "IntuneManagementExtension" -ErrorAction SilentlyContinue

if ($Service) {
    Restart-Service -Name "IntuneManagementExtension" -Force
    Write-Host "Service Restarted." -ForegroundColor Green
} else {
    Write-Warning "Intune Management Extension service not found on this machine."
}
