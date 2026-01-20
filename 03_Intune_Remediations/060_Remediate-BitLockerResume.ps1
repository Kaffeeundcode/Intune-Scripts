<#
.SYNOPSIS
    Aktiviert (Resumed) den BitLocker-Schutz wieder.
    (Intune Remediation Script)

.DESCRIPTION
    Führt Resume-BitLocker aus.

.NOTES
    File Name: 060_Remediate-BitLockerResume.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

try {
    Write-Host "Aktiviere BitLocker..."
    Resume-BitLocker -MountPoint "C:" -ErrorAction Stop
    Write-Host "BitLocker aktiviert."

} catch {
    Write-Error "Fehler: $_"
    exit 1
}
