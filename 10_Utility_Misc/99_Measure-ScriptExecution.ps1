<#
.SYNOPSIS
    Misst die Laufzeit eines Befehls.

.DESCRIPTION
    <!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

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
