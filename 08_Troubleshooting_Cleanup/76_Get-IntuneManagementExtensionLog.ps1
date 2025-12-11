<#
.SYNOPSIS
    Retrieves IME Logs (Client Side).
    
.DESCRIPTION
    Copies Intune Management Extension logs to a zip file on Desktop.
    Run locally.

.NOTES
    File Name: 76_Get-IntuneManagementExtensionLog.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

$LogPath = "C:\ProgramData\Microsoft\IntuneManagementExtension\Logs"
$Dest = "$env:USERPROFILE\Desktop\IME_Logs_$(Get-Date -Format 'yyyyMMdd').zip"

if (Test-Path $LogPath) {
    Compress-Archive -Path "$LogPath\*.log" -DestinationPath $Dest -Force
    Write-Host "Logs zipped to $Dest" -ForegroundColor Green
} else {
    Write-Warning "IME Log folder not found."
}
