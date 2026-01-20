<#
.SYNOPSIS
    Löscht abgelaufene Zertifikate aus dem 'Personal' Store.
    (Intune Remediation Script)

.DESCRIPTION
    Entfernt Zertifikate, die abgelaufen sind, um Warnmeldungen zu vermeiden.
    VORSICHT: Nur für abgelaufene Zertifikate!

.NOTES
    File Name: 044_Remediate-OldCertificates.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

try {
    $Expired = Get-ChildItem -Path Cert:\LocalMachine\My | Where-Object { $_.NotAfter -lt (Get-Date) }
    
    if ($Expired) {
        foreach ($cert in $Expired) {
            Write-Host "Lösche $($cert.Subject) (Exp: $($cert.NotAfter))"
            Remove-Item -Path $cert.PSPath -Force
        }
    }
    
    Write-Host "Bereinigung beendet."

} catch {
    Write-Error "Fehler: $_"
    exit 1
}
