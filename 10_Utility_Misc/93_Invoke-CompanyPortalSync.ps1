<#
.SYNOPSIS
    Triggers 'Sync' button in Company Portal (URI Scheme).
    
.DESCRIPTION
    Opens Company Portal to initiate check-in.
    
.NOTES
    File Name: 93_Invoke-CompanyPortalSync.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

Start-Process "companyportal:actions=checkCompliance"
Write-Host "Opened Company Portal sync action." -ForegroundColor Green
