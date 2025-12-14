<#
.SYNOPSIS
    Fügt einer App ein Client Secret hinzu.
    
.DESCRIPTION
    Erstellt einen neuen geheimen Schlüssel (Secret) für eine App.
    WICHTIG: Das Secret wird nur einmal angezeigt!
    Erfordert die Berechtigung 'Application.ReadWrite.All'.

.NOTES
    File Name: 123_Add-AppSecret.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [string]$AppId,
    [string]$Description = "Script Secret"
)

Connect-MgGraph -Scopes "Application.ReadWrite.All"

$App = Get-MgApplication -Filter "appId eq '$AppId'"
if ($App) {
    $Secret = Add-MgApplicationPassword -ApplicationId $App.Id -DisplayName $Description
    Write-Host "Secret Value (nur jetzt sichtbar): $($Secret.SecretText)" -ForegroundColor Red
}
