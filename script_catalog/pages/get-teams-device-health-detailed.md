# Get-TeamsDeviceHealthDetailed

**Prüfstatus: Ungeprüft**

Deep dive into Teams Devices (Rooms, Panels, Phones) health.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Lists all provisioned Teams devices and checks their health status:
    - Software version
    - Network connectivity
    - Peripherals status (Camera/Mic)

    Useful for MTR (Microsoft Teams Room) fleet management.

## Prüfung

Keine fachliche Freigabe aus der Katalogerstellung ableiten.

- static: aktueller erfolgreicher Nachweis fehlt
- pester: aktueller erfolgreicher Nachweis fehlt
- windows: aktueller erfolgreicher Nachweis fehlt
- tenant: aktueller erfolgreicher Nachweis fehlt

## Voraussetzungen

- Module: Microsoft.Graph.Authentication, Microsoft.Graph (passende SDK-Untermodule)
- Dokumentierte Graph-Scopes: TeamworkDevice.Read.All
- Hilfsdateien: Keine lokale Hilfsdatei erkannt.

## Verwendung

Noch kein geprüftes Aufrufbeispiel dokumentiert. Parameter mit `Get-Help './16_Mixed_New_Scripts/140_Get-TeamsDeviceHealthDetailed.ps1' -Full` lesen.

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/16_Mixed_New_Scripts/140_Get-TeamsDeviceHealthDetailed.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
