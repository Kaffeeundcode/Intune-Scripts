<#
.SYNOPSIS
    Einfache Logging-Funktion.
    
.DESCRIPTION
    Schreibt Text in eine lokale Logdatei mit Zeitstempel.
    
.NOTES
    File Name: 92_Log-Activity.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [string]$Message,
    [string]$LogFile = "$HOME/Desktop/ScriptLog.txt"
)

$Line = "$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss') - $Message"
Add-Content -Path $LogFile -Value $Line
Write-Host "Log: $Line"
