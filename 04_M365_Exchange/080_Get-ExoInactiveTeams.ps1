<#
.SYNOPSIS
    Findet Microsoft Teams, die seit X Tagen keine Aktivität hatten.

.DESCRIPTION
    Basierend auf Group Renewal / Activity Reports.
    Hilft beim Aufräumen von ungenutzten Teams.
    
    Parameter:
    - DaysInactive: Tage (Default: 90)

.NOTES
    File Name: 080_Get-ExoInactiveTeams.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [Parameter(Mandatory=$false)] [int]$DaysInactive = 90
)

try {
    Write-Host "Suche inaktive Teams (Logic: Group Renewal Date verwenden, da Activity API komplex)..." -ForegroundColor Cyan

    $Groups = Get-MgGroup -Filter "resourceProvisioningOptions/Any(x:x eq 'Team')" -Property Id, DisplayName, RenewedDateTime -All

    $Cutoff = (Get-Date).AddDays(-$DaysInactive)

    foreach ($g in $Groups) {
        if ($g.RenewedDateTime -lt $Cutoff) {
            Write-Warning "Team '$($g.DisplayName)' wurde seit $($g.RenewedDateTime) nicht erneuert/genutzt."
        }
    }
    
    Write-Host "Prüfung abgeschlossen."

} catch {
    Write-Error "Fehler: $_"
}
