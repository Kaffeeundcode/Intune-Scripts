<#
.SYNOPSIS
    Zeigt Versionen der installierten Intune/Graph Module.
    
.DESCRIPTION
    Listet Versionen von Microsoft.Graph.* Modulen auf.
    Hilfreich für Troubleshooting bei Versionskonflikten.

.NOTES
    File Name: 84_Get-IntunePowerShellVersion.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param()

Get-Module -Name "Microsoft.Graph*" -ListAvailable | Select-Object Name, Version
