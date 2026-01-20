<#
.SYNOPSIS
    Setzt Kalenderberechtigungen für eine Mailbox.

.DESCRIPTION
    Häufiger Anwendungsfall: Assistent/in benötigt Zugriff auf Kalender von Chef/in.
    
    Parameter:
    - Identity: Mailbox (UPN)
    - User: Wer bekommt Zugriff?
    - AccessRights: Berechtigung (Reviewer, Editor, AvailabilityOnly)

.NOTES
    File Name: 066_Set-ExoMailboxCalendarPermissions.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [Parameter(Mandatory=$true)] [string]$Identity,
    [Parameter(Mandatory=$true)] [string]$User,
    [Parameter(Mandatory=$true)] [string]$AccessRights = "Reviewer"
)

try {
    # Kalender-Folder identifizieren (je nach Sprache "Calendar", "Kalender"...)
    # Get-ExoMailboxFolderStatistics wäre genau, aber für Add-MailboxFolderPermission reicht oft ":\Calendar" Alias
    
    # Sicherer Weg: Folder abrufen
    $Calendar = Get-MailboxFolderStatistics -Identity $Identity -FolderScope Calendar | Where-Object { $_.FolderType -eq "Calendar" }
    
    if (-not $Calendar) {
        throw "Kalenderordner nicht gefunden."
    }

    $FolderPath = "$($Identity):$($Calendar.FolderPath.Replace('/','\'))" # Format User:\Kalender

    Write-Host "Setze Rechte '$AccessRights' für '$User' auf '$FolderPath'..." -ForegroundColor Cyan

    # Prüfen ob Rechte schon da sind -> Set, sonst Add
    $Existing = Get-MailboxFolderPermission -Identity $FolderPath -User $User -ErrorAction SilentlyContinue

    if ($Existing) {
        Set-MailboxFolderPermission -Identity $FolderPath -User $User -AccessRights $AccessRights -ErrorAction Stop
        Write-Host "Rechte aktualisiert." -ForegroundColor Green
    } else {
        Add-MailboxFolderPermission -Identity $FolderPath -User $User -AccessRights $AccessRights -ErrorAction Stop
        Write-Host "Rechte hinzugefügt." -ForegroundColor Green
    }

} catch {
    Write-Error "Fehler: $_"
}
