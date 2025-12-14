<#
.SYNOPSIS
    Zeigt die konfigurierten API-Permissions einer App.
    
.DESCRIPTION
    Liest 'RequiredResourceAccess' aus.
    Erfordert die Berechtigung 'Application.Read.All'.

.NOTES
    File Name: 128_Get-AppPermissions.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [string]$AppId
)

$App = Get-MgApplication -Filter "appId eq '$AppId'"
if ($App) {
    $App.RequiredResourceAccess | ForEach-Object {
        Write-Host "Ressource: $($_.ResourceAppId)"
        $_.ResourceAccess | ForEach-Object { Write-Host " - Type: $($_.Type) | ID: $($_.Id)" }
    }
}
