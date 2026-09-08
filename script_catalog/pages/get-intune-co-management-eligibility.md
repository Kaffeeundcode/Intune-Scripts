# Get-IntuneCoManagementEligibility

**Prüfstatus: Ungeprüft**

Analyzes devices to determine their eligibility for Co-Management (Intune + ConfigMgr).

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    This script connects to Microsoft Graph to retrieve Windows devices and checks various
    attributes (OS version, Join Type, Management capability) to report if they are ready
    to be co-managed.

    It highlights devices that are:
    - Domain Joined (Hybrid)
    - Running compatible Windows 10/11 versions
    - Not yet managed by MDM

## Prüfung

Keine fachliche Freigabe aus der Katalogerstellung ableiten.

- static: aktueller erfolgreicher Nachweis fehlt
- pester: aktueller erfolgreicher Nachweis fehlt
- windows: aktueller erfolgreicher Nachweis fehlt
- tenant: aktueller erfolgreicher Nachweis fehlt

## Voraussetzungen

- Module: Microsoft.Graph.Authentication, Microsoft.Graph (passende SDK-Untermodule)
- Dokumentierte Graph-Scopes: Device.Read.All
- Hilfsdateien: Keine lokale Hilfsdatei erkannt.

## Verwendung

Noch kein geprüftes Aufrufbeispiel dokumentiert. Parameter mit `Get-Help './16_Mixed_New_Scripts/101_Get-IntuneCoManagementEligibility.ps1' -Full` lesen.

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/16_Mixed_New_Scripts/101_Get-IntuneCoManagementEligibility.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
