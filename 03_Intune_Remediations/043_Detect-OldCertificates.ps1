<#
.SYNOPSIS
    Erkennen von abgelaufenen Zertifikaten im 'Personal' Store.
    (Intune Detection Script)

.DESCRIPTION
    Prüft, ob Zertifikate vorhanden sind, die abgelaufen sind.

.NOTES
    File Name: 043_Detect-OldCertificates.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

try {
    $Expired = Get-ChildItem -Path Cert:\LocalMachine\My | Where-Object { $_.NotAfter -lt (Get-Date) }
    
    if ($Expired) {
        Write-Host "Abgelaufene Zertifikate gefunden: $($Expired.Count)"
        exit 1 # Trigger Remediation
    } else {
        Write-Host "Keine abgelaufenen Zertifikate."
        exit 0
    }

} catch {
    Write-Error "Fehler: $_"
    exit 1
}
