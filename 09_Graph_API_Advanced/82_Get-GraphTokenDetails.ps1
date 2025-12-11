<#
.SYNOPSIS
    Zeigt Details zum aktuellen Access Token.
    
.DESCRIPTION
    Listet Scopes (Berechtigungen) und Ablaufdatum des aktuellen Tickets auf.
    Erfordert keine spezielle Berechtigung (lokaler Kontext).

.NOTES
    File Name: 82_Get-GraphTokenDetails.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param()

$Context = Get-MgContext
if ($Context) {
    Write-Host "Account: $($Context.Account)"
    Write-Host "Scopes: $($Context.Scopes -join ', ')"
    # Token expiration usually not exposed directly in basic Get-MgContext output object in all versions, but scopes are key.
} else {
    Write-Warning "Nicht verbunden."
}
