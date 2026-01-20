<#
.SYNOPSIS
    Prüft, ob unerwünschte Benutzer in der lokalen Administratorengruppe sind.
    (Intune Detection Script)

.DESCRIPTION
    Vergleicht die Mitglieder der Gruppe "Administrators" mit einer Allowed-List.
    NonCompliant, wenn Unbekannte gefunden werden.

    Parameter:
    - AllowedUsers: Kommagetrennte Liste von erlaubten Usern/SIDs (z.B. Administrator,Domain Admins).

.NOTES
    File Name: 045_Detect-LocalAdmin.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [string[]]$AllowedUsers = @("Administrator", "Domain Admins", "AzureAD\TheUser") 
)

try {
    $Members = Get-LocalGroupMember -Group "Administrators"
    $FoundBad = $false

    foreach ($m in $Members) {
        # Namen bereinigen (DOMAIN\User -> User) für einfachen Vergleich, oder Full Match
        if ($m.Name -notin $AllowedUsers -and $m.ObjectClass -eq "User") {
            $FoundBad = $true
            Write-Host "Unerlaubter Admin gefunden: $($m.Name)"
        }
    }

    if ($FoundBad) {
        Write-Host "NonCompliant"
        exit 1
    } else {
        Write-Host "Compliant"
        exit 0
    }

} catch {
    Write-Error "Fehler: $_"
    exit 1
}
