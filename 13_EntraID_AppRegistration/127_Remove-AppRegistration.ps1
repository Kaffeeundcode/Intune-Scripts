<#
.SYNOPSIS
    Löscht eine App Registration.
    
.DESCRIPTION
    Entfernt die App endgültig.
    Erfordert die Berechtigung 'Application.ReadWrite.All'.

.NOTES
    File Name: 127_Remove-AppRegistration.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [string]$AppId
)

Connect-MgGraph -Scopes "Application.ReadWrite.All"

$App = Get-MgApplication -Filter "appId eq '$AppId'"
if ($App) {
    Remove-MgApplication -ApplicationId $App.Id
    Write-Host "App gelöscht." -ForegroundColor Red
}
