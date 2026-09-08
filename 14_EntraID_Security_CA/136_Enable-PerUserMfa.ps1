<#
.SYNOPSIS
    Aktiviert Per-User MFA (Legacy).

.DESCRIPTION
    <!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Aktiviert MFA direkt am Userobjekt (nicht empfohlen, besser CA Policies nutzen!).

.NOTES
    File Name: 136_Enable-PerUserMfa.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

Write-Warning "Legacy Per-User MFA sollte durch Conditional Access ersetzt werden. Skript deaktiviert."
