# Get-AppProtectionPolicies

**Prüfstatus: Ungeprüft**

Listet App-Schutzrichtlinien (MAM) auf.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Liest paginierte Graph-beta-Daten und liefert weiterverarbeitbare Objekte.
    Graph-Scopes: DeviceManagementApps.Read.All.
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
- Dokumentierte Graph-Scopes: DeviceManagementApps.Read.All
- Hilfsdateien: Keine lokale Hilfsdatei erkannt.

## Verwendung

```powershell
./02_App_Management/20_Get-AppProtectionPolicies.ps1
```

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/02_App_Management/20_Get-AppProtectionPolicies.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
