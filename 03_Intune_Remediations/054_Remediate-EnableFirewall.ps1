<#
.SYNOPSIS
    Aktiviert alle Windows Firewall Profile.
    (Intune Remediation Script)

.DESCRIPTION
    <!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Setzt Domain, Public und Private Profile auf 'Enabled'.

.NOTES
    File Name: 054_Remediate-EnableFirewall.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

try {
    Write-Host "Aktiviere Firewall Profile..."
    Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled True -ErrorAction Stop
    Write-Host "Firewall aktiviert."

} catch {
    Write-Error "Fehler: $_"
    exit 1
}
