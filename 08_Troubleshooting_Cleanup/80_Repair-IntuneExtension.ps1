<#
.SYNOPSIS
    Versucht, Intune Management Extension (IME) Probleme zu beheben.

.DESCRIPTION
    <!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Restartet Dienst (lokales Skript, kein Graph).
    Dies muss auf dem Client ausgeführt werden.

.NOTES
    File Name: 80_Repair-IntuneExtension.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

Restart-Service -Name "IntuneManagementExtension" -Force
Write-Host "IME Service restartet."
