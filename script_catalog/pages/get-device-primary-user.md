# Get-DevicePrimaryUser

**Prüfstatus: Ungeprüft**

Ermittelt den primären Benutzer eines Intune-Geräts.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Liest Geraet und die users-Beziehung; liefert weiterverarbeitbare PowerShell-Objekte.
    Graph-Scopes: DeviceManagementManagedDevices.Read.All.
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
- Dokumentierte Graph-Scopes: DeviceManagementManagedDevices.Read.All
- Hilfsdateien: Keine lokale Hilfsdatei erkannt.

## Verwendung

```powershell
./01_Device_Management/07_Get-DevicePrimaryUser.ps1 -DeviceName "TEST-PC"
```

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/01_Device_Management/07_Get-DevicePrimaryUser.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
