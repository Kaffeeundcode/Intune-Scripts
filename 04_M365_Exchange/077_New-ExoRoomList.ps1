<#
.SYNOPSIS
    Erstellt eine Room List und fügt Räume hinzu.

.DESCRIPTION
    Room Lists helfen im Outlook "Room Finder", Räume nach Standort/Gebäude zu gruppieren.
    
    Parameter:
    - ListName: Name der Liste (z.B. "Gebäude A")
    - ListEmail: E-Mail der Liste
    - Rooms: Array von Raum-Mailboxen zum Hinzufügen.

.NOTES
    File Name: 077_New-ExoRoomList.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [Parameter(Mandatory=$true)] [string]$ListName,
    [Parameter(Mandatory=$true)] [string]$ListEmail,
    [Parameter(Mandatory=$false)] [string[]]$Rooms
)

try {
    Write-Host "Erstelle Room List '$ListName'..." -ForegroundColor Cyan

    New-DistributionGroup -Name $ListName -DisplayName $ListName -PrimarySmtpAddress $ListEmail -RoomList -ErrorAction Stop
    
    if ($Rooms) {
        Write-Host "Füge Räume hinzu..."
        foreach ($r in $Rooms) {
            Add-DistributionGroupMember -Identity $ListEmail -Member $r -ErrorAction SilentlyContinue
        }
    }
    
    Write-Host "Room List erstellt." -ForegroundColor Green

} catch {
    Write-Error "Fehler: $_"
}
