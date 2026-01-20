<#
.SYNOPSIS
    Startet einen gestoppten Dienst.
    (Intune Remediation Script)

.DESCRIPTION
    Versucht, den Dienst zu starten und setzt den Starttyp auf 'Automatic'.

    Parameter:
    - ServiceName: Name des Dienstes

.NOTES
    File Name: 048_Remediate-ServiceStart.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [Parameter(Mandatory=$true)] [string]$ServiceName
)

try {
    Write-Host "Konfiguriere Dienst $ServiceName..."
    Set-Service -Name $ServiceName -StartupType Automatic -ErrorAction Stop
    Start-Service -Name $ServiceName -ErrorAction Stop
    
    Write-Host "Dienst gestartet."

} catch {
    Write-Error "Fehler: $_"
    exit 1
}
