<#
.SYNOPSIS
    Prüft Internetverbindung zu MS Graph.

.DESCRIPTION
    <!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Ping / Test-Connection zu graph.microsoft.com.

.NOTES
    File Name: 95_Check-InternetConnection.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

if (Test-Connection graph.microsoft.com -Count 1 -Quiet) {
    Write-Host "Verbindung zu Graph API OK." -ForegroundColor Green
} else {
    Write-Error "Keine Verbindung zu graph.microsoft.com"
}
