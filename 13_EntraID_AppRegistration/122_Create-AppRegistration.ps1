<#
.SYNOPSIS
    Erstellt eine neue App Registration.
    
.DESCRIPTION
    Registriert eine neue Anwendung (Client App).
    Erfordert die Berechtigung 'Application.ReadWrite.All'.

.NOTES
    File Name: 122_Create-AppRegistration.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [string]$AppName = "My PowerShell App"
)

Connect-MgGraph -Scopes "Application.ReadWrite.All"

$App = New-MgApplication -DisplayName $AppName -SignInAudience "AzureADMyOrg"
Write-Host "App erstellt: $($App.DisplayName) (ID: $($App.AppId))" -ForegroundColor Green
