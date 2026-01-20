<#
.SYNOPSIS
    Löscht den lokalen Teams-Cache (Client-Side).

.DESCRIPTION
    Behebt häufige Login- oder Anzeigeprobleme im Teams Desktop Client.
    Muss im User-Kontext ausgeführt werden. Beendet Teams vor dem Löschen.

.NOTES
    File Name: 079_Clear-TeamsCache.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

try {
    Write-Host "Beende Teams..." -ForegroundColor Yellow
    Get-Process -Name Teams -ErrorAction SilentlyContinue | Stop-Process -Force
    
    $LegacyPath = "$env:APPDATA\Microsoft\Teams"
    # New Teams (V2) nutzt MSIX Pfade, cleaning ist dort anders (Reset-AppxPackage).
    # Hier Fokus auf Classic / Roaming Profile Data die oft Probleme macht.
    
    if (Test-Path $LegacyPath) {
        Write-Host "Lösche Cache in $LegacyPath..."
        Remove-Item -Path "$LegacyPath\*" -Recurse -Force -ErrorAction SilentlyContinue
    }
    
    Write-Host "Cache geleert. Bitte Teams neu starten." -ForegroundColor Green

} catch {
    Write-Error "Fehler: $_"
}
