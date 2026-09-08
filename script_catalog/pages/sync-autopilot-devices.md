# Sync-AutopilotDevices

**Prüfstatus: Ungeprüft**

Triggered eine Synchronisierung der Autopilot-Geräte (Store/Partner).

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Stößt den Sync-Prozess an, um neue Geräte aus dem Microsoft Store for Business oder von Partnern zu laden.
    Erfordert die Berechtigung 'DeviceManagementServiceConfig.ReadWrite.All'.

## Prüfung

Keine fachliche Freigabe aus der Katalogerstellung ableiten.

- static: aktueller erfolgreicher Nachweis fehlt
- pester: aktueller erfolgreicher Nachweis fehlt
- windows: aktueller erfolgreicher Nachweis fehlt
- tenant: aktueller erfolgreicher Nachweis fehlt

## Voraussetzungen

- Module: Microsoft.Graph.Authentication
- Dokumentierte Graph-Scopes: DeviceManagementServiceConfig.ReadWrite.All
- Hilfsdateien: Keine lokale Hilfsdatei erkannt.

## Verwendung

Noch kein geprüftes Aufrufbeispiel dokumentiert. Parameter mit `Get-Help './05_Enrollment_Autopilot/47_Sync-AutopilotDevices.ps1' -Full` lesen.

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/05_Enrollment_Autopilot/47_Sync-AutopilotDevices.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
