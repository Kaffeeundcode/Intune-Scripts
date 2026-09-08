<#
.SYNOPSIS
    Zeigt Versionen der installierten Intune/Graph Module.

.DESCRIPTION
    <!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Listet Versionen von Microsoft.Graph.* Modulen auf.
    Hilfreich für Troubleshooting bei Versionskonflikten.

.NOTES
    File Name: 84_Get-IntunePowerShellVersion.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param()

Get-Module -Name "Microsoft.Graph*" -ListAvailable | Select-Object Name, Version
