<#
.SYNOPSIS
    Konvertiert Intune-Zeitstempel.
    
.DESCRIPTION
    Wandelt UTC-Strings aus Graph in lokale Zeit um.
    
.NOTES
    File Name: 93_Convert-IntuneTime.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [string]$TimeString
)

if ($TimeString) {
    [DateTime]$Date = $TimeString
    Write-Host "Local Time: $($Date.ToLocalTime())"
}
