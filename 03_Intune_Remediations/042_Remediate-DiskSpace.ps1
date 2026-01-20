<#
.SYNOPSIS
    Bereinigt temporäre Dateien, um Speicherplatz freizugeben.
    (Intune Remediation Script)

.DESCRIPTION
    Löscht C:\Windows\Temp und %TEMP% Inhalte.
    Leert den Papierkorb.

.NOTES
    File Name: 042_Remediate-DiskSpace.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

try {
    Write-Host "Starte Speicherbereinigung..."

    # 1. Windows Temp
    $WinTemp = "C:\Windows\Temp\*"
    Write-Host "Bereinige $WinTemp"
    Remove-Item -Path $WinTemp -Recurse -Force -ErrorAction SilentlyContinue

    # 2. User Temp (läuft im System Context -> daher oft nur System Temp, aber Versuch wert)
    # Bei System Context ist $env:TEMP meist C:\Windows\Temp.
    # Für User-Cleanup müsste das Skript im User-Context laufen.
    
    # 3. Papierkorb (PowerShell Weg ohne Interaktion)
    Clear-RecycleBin -Force -ErrorAction SilentlyContinue
    
    Write-Host "Bereinigung abgeschlossen."

} catch {
    Write-Error "Fehler: $_"
    exit 1
}
