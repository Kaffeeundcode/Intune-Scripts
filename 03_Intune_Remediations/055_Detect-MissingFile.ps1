<#
.SYNOPSIS
    Prüft, ob eine bestimmte Datei existiert.
    (Intune Detection Script)

.DESCRIPTION
    Nützlich, um sicherzustellen, dass Config-Files oder Tools verteilt wurden.

    Parameter:
    - FilePath: Pfad zur Datei.

.NOTES
    File Name: 055_Detect-MissingFile.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [Parameter(Mandatory=$true)] [string]$FilePath
)

try {
    if (Test-Path $FilePath) {
        Write-Host "Compliant"
        exit 0
    } else {
        Write-Host "NonCompliant (Datei fehlt: $FilePath)"
        exit 1
    }

} catch {
    Write-Error "Fehler: $_"
    exit 1
}
