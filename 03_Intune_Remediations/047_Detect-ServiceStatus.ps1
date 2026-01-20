<#
.SYNOPSIS
    Prüft, ob ein wichtiger Windows-Dienst läuft.
    (Intune Detection Script)

.DESCRIPTION
    NonCompliant, wenn der Dienst nicht 'Running' ist.

    Parameter:
    - ServiceName: Name des Dienstes (z.B. Spooler, W32Time)

.NOTES
    File Name: 047_Detect-ServiceStatus.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [Parameter(Mandatory=$true)] [string]$ServiceName
)

try {
    $Svc = Get-Service -Name $ServiceName -ErrorAction SilentlyContinue

    if (-not $Svc) {
        Write-Host "Dienst $ServiceName nicht gefunden."
        exit 0 # Oder 1, je nach Policy. Hier: Ignorieren wenn nicht installiert.
    }

    if ($Svc.Status -eq "Running") {
        Write-Host "Compliant"
        exit 0
    } else {
        Write-Host "NonCompliant ($($Svc.Status))"
        exit 1
    }

} catch {
    Write-Error "Fehler: $_"
    exit 1
}
