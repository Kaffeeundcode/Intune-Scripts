<#
.SYNOPSIS
    Widerruft alle Refresh Tokens eines Benutzers (Zwangsabmeldung).

.DESCRIPTION
    Nützlich bei Verdacht auf Kompromittierung oder bei Verlust eines Geräts.
    Zwingt den Benutzer zur erneuten Anmeldung auf allen Geräten/Apps.

    Parameter:
    - UserPrincipalName: Der betroffene Benutzer.

.NOTES
    File Name: 031_Revoke-EntraIDUserAllRefreshTokens.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [Parameter(Mandatory=$true)] [string]$UserPrincipalName
)

try {
    Write-Host "Widerrufe Sitzungen für '$UserPrincipalName'..." -ForegroundColor Cyan

    $User = Get-MgUser -UserId $UserPrincipalName -ErrorAction Stop
    
    Revoke-MgUserSignInSession -UserId $User.Id -ErrorAction Stop | Out-Null
    
    Write-Host "Alle Sitzungen wurden erfolgreich widerrufen." -ForegroundColor Green
    Write-Host "Der Benutzer muss sich nun überall neu anmelden."

} catch {
    Write-Error "Fehler: $_"
}
