<#
.SYNOPSIS
    Prüft Ablaufdaten von Secrets und Zertifikaten bei App Registrations.

.DESCRIPTION
    Listet alle Apps auf, deren Credentials in den nächsten X Tagen ablaufen.

    Parameter:
    - DaysWarning: Warnschwelle in Tagen (Default: 30)

.NOTES
    File Name: 032_Get-EntraIDApplicationExpiry.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [Parameter(Mandatory=$false)] [int]$DaysWarning = 30
)

try {
    Write-Host "Suche Apps mit bald ablaufenden Secrets (< $DaysWarning Tage)..." -ForegroundColor Cyan
    
    $Apps = Get-MgApplication -All
    $Cutoff = (Get-Date).AddDays($DaysWarning)

    foreach ($app in $Apps) {
        # Prüfe PasswordCredentials
        foreach ($cred in $app.PasswordCredentials) {
            if ($cred.EndDateTime -lt $Cutoff) {
                Write-Warning "App '$($app.DisplayName)' - Secret KeyId $($cred.KeyId) läuft ab am: $($cred.EndDateTime)"
            }
        }
        
        # Prüfe KeyCredentials (Certs)
        foreach ($cert in $app.KeyCredentials) {
            if ($cert.EndDateTime -lt $Cutoff) {
                Write-Warning "App '$($app.DisplayName)' - Zertifikat KeyId $($cert.KeyId) läuft ab am: $($cert.EndDateTime)"
            }
        }
    }

} catch {
    Write-Error "Fehler: $_"
}
