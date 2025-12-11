<#
.SYNOPSIS
    Sammelt lokale Intune Logs (Client-Side).
    
.DESCRIPTION
    Zippt den Ordner C:\ProgramData\Microsoft\IntuneManagementExtension\Logs.
    Muss auf dem Client laufen.

.NOTES
    File Name: 94_Get-LocalIntuneLogs.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

$Source = "C:\ProgramData\Microsoft\IntuneManagementExtension\Logs"
$Dest = "$HOME\Desktop\IntuneLogs.zip"

if (Test-Path $Source) {
    Compress-Archive -Path $Source -DestinationPath $Dest -Force
    Write-Host "Logs gezippt nach $Dest"
} else {
    Write-Warning "IME Logs nicht gefunden (läuft das hier auf einem Client?)."
}
