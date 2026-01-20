<#
.SYNOPSIS
    Prüft, ob der BitLocker-Schutz angehalten (suspended) ist.
    (Intune Detection Script)

.DESCRIPTION
    NonCompliant, wenn ProtectionStatus 'Off' ist auf Laufwerk C:.

.NOTES
    File Name: 059_Detect-BitLockerSuspended.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

try {
    $Status = Get-BitLockerVolume -MountPoint "C:" -ErrorAction Stop
    
    if ($Status.ProtectionStatus -eq "Off") {
        Write-Host "NonCompliant (BitLocker Suspended/Off)"
        exit 1
    } else {
        Write-Host "Compliant"
        exit 0
    }

} catch {
    Write-Error "Fehler: $_"
    exit 1
}
