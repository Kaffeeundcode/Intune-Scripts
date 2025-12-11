<#
.SYNOPSIS
    Leaves Hybrid Azure AD Join (Client Side).
    
.DESCRIPTION
    Runs dsregcmd /leave.
    
.NOTES
    File Name: 79_Un-JoinHybridAzureAD.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

Write-Host "Leaving Hybrid Azure AD..."
dsregcmd /leave
Write-Host "Command executed. Please restart." -ForegroundColor Yellow
