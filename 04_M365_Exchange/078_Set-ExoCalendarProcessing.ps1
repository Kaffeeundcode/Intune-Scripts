<#
.SYNOPSIS
    Konfiguriert die automatische Verarbeitung von Raumbuchungen.

.DESCRIPTION
    Stellt sicher, dass Raumpostfächer Einladungen automatisch annehmen (AutoAccept).
    Entfernt außerdem den Betreff, wenn gewünscht (Privacy).

    Parameter:
    - Identity: Raumpostfach
    - AutoAccept: $true (Default)
    - AddOrganizerToSubject: $false (Default, Privacy)

.NOTES
    File Name: 078_Set-ExoCalendarProcessing.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [Parameter(Mandatory=$true)] [string]$Identity,
    [Parameter(Mandatory=$false)] [bool]$AutoAccept = $true,
    [Parameter(Mandatory=$false)] [bool]$AddOrganizerToSubject = $false
)

try {
    Write-Host "Konfiguriere Raum '$Identity'..." -ForegroundColor Cyan

    $Mode = if ($AutoAccept) { "AutoAccept" } else { "None" }
    
    Set-CalendarProcessing -Identity $Identity `
                           -AutomateProcessing $Mode `
                           -AddOrganizerToSubject $AddOrganizerToSubject `
                           -DeleteComments $false `
                           -AllowConflicts $false `
                           -ErrorAction Stop
                           
    Write-Host "Konfiguration angewendet ($Mode)." -ForegroundColor Green

} catch {
    Write-Error "Fehler: $_"
}
