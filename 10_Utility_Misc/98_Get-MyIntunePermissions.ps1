<#
.SYNOPSIS
    Zeigt meine Berechtigungen im detail.
    
.DESCRIPTION
    Detaillierte Auflistung der Token-Scopes.
    Erfordert: User.Read.

.NOTES
    File Name: 98_Get-MyIntunePermissions.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

Connect-MgGraph
(Get-MgContext).Scopes | ForEach-Object { Write-Host "- $_" -ForegroundColor Cyan }
