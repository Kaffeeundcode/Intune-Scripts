<#
.SYNOPSIS
    Findet inaktive Gast-Benutzer basierend auf dem letzten Login.

.DESCRIPTION
    Listet alle Guest-User, die sich seit X Tagen nicht angemeldet haben.
    Wichtig für Lizenz-Management und Sicherheit.

    Parameter:
    - DaysInactive: Anzahl der Tage (Default: 90)

.NOTES
    File Name: 023_Get-EntraIDGuestUserLastSignIn.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [Parameter(Mandatory=$false)] [int]$DaysInactive = 90
)

try {
    Write-Host "Suche inaktive Gäste (> $DaysInactive Tage)..." -ForegroundColor Cyan
    $DateCutoff = (Get-Date).AddDays(-$DaysInactive)

    Get-MgUser -Filter "userType eq 'Guest'" -Property Id, DisplayName, UserPrincipalName, SignInActivity -All | ForEach-Object {
        $LastSign = $_.SignInActivity.LastSignInDateTime
        
        if (-not $LastSign) {
            Write-Host "Gast '$($_.DisplayName)' hat sich noch NIE angemeldet." -ForegroundColor Red
        } elseif ($LastSign -lt $DateCutoff) {
            Write-Host "Gast '$($_.DisplayName)' inaktiv seit $LastSign" -ForegroundColor Yellow
        }
    }

} catch {
    Write-Error "Fehler (Benötigt AuditLog.Read.All): $_"
}
