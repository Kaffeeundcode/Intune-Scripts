<#
.SYNOPSIS
    Aktualisiert das Microsoft.Graph Modul.
    
.DESCRIPTION
    Führt Update-Module aus.
    
.NOTES
    File Name: 97_Update-IntuneModule.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

Update-Module Microsoft.Graph -Scope CurrentUser -Force
Write-Host "Update durchgeführt."
