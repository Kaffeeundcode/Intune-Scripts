<#
.SYNOPSIS
    Testet die Verbindung zu Microsoft Graph.

.DESCRIPTION
    <!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Prüft, ob ein gültiges Token ("Me"-Context) abgerufen werden kann.
    Erfordert die Berechtigung 'User.Read'.

.NOTES
    File Name: 81_Authentication-Test.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param()

try {
    Connect-MgGraph -Scopes "User.Read"
    $Context = Get-MgContext
    if ($Context) {
        Write-Host "Verbindung erfolgreich als: $($Context.Account)" -ForegroundColor Green
    }
} catch {
    Write-Error "Verbindung fehlgeschlagen: $_"
}
