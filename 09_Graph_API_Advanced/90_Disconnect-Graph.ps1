<#
.SYNOPSIS
    Trennt die Verbindung zu Graph.
    
.DESCRIPTION
    Löscht den Token-Cache der aktuellen Sitzung.
    
.NOTES
    File Name: 90_Disconnect-Graph.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param()

Disconnect-MgGraph
Write-Host "Verbindung getrennt." -ForegroundColor Yellow
