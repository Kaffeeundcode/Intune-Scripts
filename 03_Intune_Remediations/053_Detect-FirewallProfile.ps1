<#
.SYNOPSIS
    Prüft, ob die Windows Firewall für alle Profile aktiviert ist.
    (Intune Detection Script)

.DESCRIPTION
    NonCompliant, wenn Domain, Public oder Private Profile deaktiviert sind.

.NOTES
    File Name: 053_Detect-FirewallProfile.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

try {
    $Profiles = Get-NetFirewallProfile
    $Disabled = $Profiles | Where-Object { $_.Enabled -ne $true }

    if ($Disabled) {
        Write-Host "NonCompliant (Deaktiviert: $($Disabled.Name))"
        exit 1
    } else {
        Write-Host "Compliant"
        exit 0
    }

} catch {
    Write-Error "Fehler: $_"
    exit 1
}
