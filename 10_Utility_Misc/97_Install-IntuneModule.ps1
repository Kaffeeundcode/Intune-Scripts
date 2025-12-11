<#
.SYNOPSIS
    Installs and Updates MS Graph Modules.
    
.DESCRIPTION
    Ensures environment is ready (Microsoft.Graph.Intune).
    
.NOTES
    File Name: 97_Install-IntuneModule.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

Write-Host "Installing Microsoft.Graph module..."
Install-Module Microsoft.Graph -Scope CurrentUser -Force -AllowClobber
Write-Host "Updating..."
Update-Module Microsoft.Graph
Write-Host "Ready." -ForegroundColor Green
