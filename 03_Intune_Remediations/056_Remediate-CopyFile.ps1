<#
.SYNOPSIS
    Kopiert eine Datei von einem Source-Pfad, falls sie fehlt.
    (Intune Remediation Script)

.DESCRIPTION
    <!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Source kann ein Netzwerk-Share oder ein temporär abgelegtes File durch ein Win32 App Paket sein.

    Parameter:
    - SourcePath: Quelle
    - DestinationPath: Ziel

.NOTES
    File Name: 056_Remediate-CopyFile.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [Parameter(Mandatory=$true)] [string]$SourcePath,
    [Parameter(Mandatory=$true)] [string]$DestinationPath
)

try {
    Write-Host "Kopiere $SourcePath nach $DestinationPath..."
    Copy-Item -Path $SourcePath -Destination $DestinationPath -Force -ErrorAction Stop
    Write-Host "Kopieren erfolgreich."

} catch {
    Write-Error "Fehler: $_"
    exit 1
}
