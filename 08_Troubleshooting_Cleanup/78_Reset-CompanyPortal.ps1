<#
.SYNOPSIS
    Resets Company Portal App (Client Side).
    
.DESCRIPTION
    Resets the app package. Run locally.

.NOTES
    File Name: 78_Reset-CompanyPortal.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

Write-Host "Resetting Company Portal..."
Get-AppxPackage *CompanyPortal* | Reset-AppxPackage
Write-Host "Done." -ForegroundColor Green
