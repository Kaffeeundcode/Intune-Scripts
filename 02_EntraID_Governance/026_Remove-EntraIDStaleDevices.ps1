<#
.SYNOPSIS
    Löscht verwaiste Geräte aus Entra ID (fka Azure AD) basierend auf dem 'ApproximateLastLogonTimeStamp'.

.DESCRIPTION
    Entra ID Geräte müssen separat von Intune bereinigt werden.
    Dieses Skript identifiziert Geräte, die sich seit X Tagen nicht angemeldet haben.
    
    ACHTUNG: Löscht Geräte unwiderruflich!

    Parameter:
    - DaysInactive: Tage seit letztem Login (Default: 180)
    - Delete: Schalter zum Löschen. Ohne Switch nur Report.

.NOTES
    File Name: 026_Remove-EntraIDStaleDevices.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [Parameter(Mandatory=$false)] [int]$DaysInactive = 180,
    [Parameter(Mandatory=$false)] [switch]$Delete
)

try {
    $DateCutoff = (Get-Date).AddDays(-$DaysInactive)
    Write-Host "Suche Geräte, inaktiv seit $DateCutoff ..." -ForegroundColor Cyan

    # Beta Profil für lastLogonTimeStamp oft nötig, oder v1.0 approximateLastSignInDateTime
    $Devices = Get-MgDevice -All -Property Id, DisplayName, ApproximateLastSignInDateTime, OperatingSystem

    $StaleDevices = @()
    foreach ($dev in $Devices) {
        if ($dev.ApproximateLastSignInDateTime -and $dev.ApproximateLastSignInDateTime -lt $DateCutoff) {
            $StaleDevices += $dev
        }
    }

    if ($StaleDevices.Count -eq 0) {
        Write-Host "Keine inaktiven Geräte gefunden." -ForegroundColor Green
        exit
    }

    Write-Warning "Gefundene inaktive Geräte: $($StaleDevices.Count)"
    $StaleDevices | Select-Object DisplayName, OperatingSystem, ApproximateLastSignInDateTime | Format-Table

    if ($Delete) {
        foreach ($del in $StaleDevices) {
            Write-Host "Lösche '$($del.DisplayName)'..." -NoNewline
            Remove-MgDevice -DeviceId $del.Id -ErrorAction Stop
            Write-Host " OK" -ForegroundColor Green
        }
    } else {
        Write-Host "Nutzen Sie '-Delete', um die Löschung durchzuführen." -ForegroundColor Yellow
    }

} catch {
    Write-Error "Fehler: $_"
}
