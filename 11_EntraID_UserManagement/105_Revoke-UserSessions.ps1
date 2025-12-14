<#
.SYNOPSIS
    Widerruft alle Sitzungen eines Benutzers (Revoke Sessions).
    
.DESCRIPTION
    Zwingt den Benutzer zur erneuten Anmeldung auf allen Geräten/Apps.
    Erfordert die Berechtigung 'User.ReadWrite.All'.

.NOTES
    File Name: 105_Revoke-UserSessions.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [Parameter(Mandatory=$true)]
    [string]$UserPrincipalName
)

Connect-MgGraph -Scopes "User.ReadWrite.All"

Invoke-MgInvalidateUserRefreshToken -UserId $UserPrincipalName
Write-Host "Alle Sitzungen für $UserPrincipalName wurden ungültig gemacht." -ForegroundColor Green
