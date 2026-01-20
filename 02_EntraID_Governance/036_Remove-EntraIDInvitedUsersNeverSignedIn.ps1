<#
.SYNOPSIS
    Löscht eingeladene Gast-Benutzer, die die Einladung nie angenommen haben.

.DESCRIPTION
    Bereinigt das Directory von "Karteileichen" (offene Einladungen).
    Löscht Gäste, die im Status "PendingAcceptance" sind und älter als X Tage.

    Parameter:
    - DaysPending: Tage seit Einladung (Default: 60)
    - Delete: Lösch-Schalter.

.NOTES
    File Name: 036_Remove-EntraIDInvitedUsersNeverSignedIn.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [Parameter(Mandatory=$false)] [int]$DaysPending = 60,
    [Parameter(Mandatory=$false)] [switch]$Delete
)

try {
    $DateCutoff = (Get-Date).AddDays(-$DaysPending)
    Write-Host "Suche offene Einladungen älter als $DateCutoff ..." -ForegroundColor Cyan

    # Filter auf CreationTime ist in v1.0 schwierig, wir filtern client-side
    $Guests = Get-MgUser -Filter "userType eq 'Guest' and externalUserState eq 'PendingAcceptance'" -Property Id, DisplayName, CreatedDateTime, Mail -All

    $ToClean = @()
    foreach ($g in $Guests) {
        if ($g.CreatedDateTime -lt $DateCutoff) {
            $ToClean += $g
        }
    }

    if ($ToClean.Count -eq 0) {
        Write-Host "Keine alten, offenen Einladungen gefunden." -ForegroundColor Green
        exit
    }

    Write-Warning "Gefunden: $($ToClean.Count)"
    $ToClean | Select-Object DisplayName, Mail, CreatedDateTime | Format-Table

    if ($Delete) {
        foreach ($del in $ToClean) {
            Write-Host "Lösche Einladung für '$($del.Mail)'..." -NoNewline
            Remove-MgUser -UserId $del.Id -ErrorAction Stop
            Write-Host " OK" -ForegroundColor Green
        }
    } else {
        Write-Host "Nutzen Sie '-Delete', um diese zu löschen." -ForegroundColor Yellow
    }

} catch {
    Write-Error "Fehler: $_"
}
