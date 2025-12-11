<#
.SYNOPSIS
    Misst die Laufzeit eines Befehls.
    
.DESCRIPTION
    Wrapper für Measure-Command.
    
.NOTES
    File Name: 99_Measure-ScriptExecution.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [scriptblock]$Command
)

$Time = Measure-Command { & $Command }
Write-Host "Dauer: $($Time.TotalSeconds) Sekunden."
