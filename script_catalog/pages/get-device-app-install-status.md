# Get-DeviceAppInstallStatus

**Prüfstatus: Ungeprüft**

Ruft den Installationsstatus von Apps für ein bestimmtes Gerät ab.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Liest paginierte Graph-beta-Daten und liefert Objekte. App-Statusberichte erfassen hier Windows-Win32/MSI/Edge-Apps; andere App-Typen separat pruefen.
    Graph-Scopes: DeviceManagementApps.Read.All, DeviceManagementManagedDevices.Read.All.
    Hilfslogik ist enthalten. Benoetigt Microsoft.Graph.Authentication.
    Alle Abfragen sind vollstaendig paginiert; nicht eindeutige Geraetenamen brechen den Lauf ab.

## Prüfung

Keine fachliche Freigabe aus der Katalogerstellung ableiten.

- static: aktueller erfolgreicher Nachweis fehlt
- pester: aktueller erfolgreicher Nachweis fehlt
- windows: aktueller erfolgreicher Nachweis fehlt
- tenant: aktueller erfolgreicher Nachweis fehlt

## Voraussetzungen

- Module: Microsoft.Graph.Authentication
- Dokumentierte Graph-Scopes: DeviceManagementApps.Read.All, DeviceManagementManagedDevices.Read.All
- Hilfsdateien: Keine lokale Hilfsdatei erkannt.

## Verwendung

```powershell
./02_App_Management/18_Get-DeviceAppInstallStatus.ps1 -DeviceName "TEST-PC"
```

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/02_App_Management/18_Get-DeviceAppInstallStatus.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
