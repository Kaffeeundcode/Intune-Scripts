# Restart-IntuneDevice

**Prüfstatus: Ungeprüft**

Startet ein verwaltetes Gerät neu (Remote Action).

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Gezielte Geraeteaktion mit -WhatIf und Bestaetigung. Keine automatische Wiederholung einer Mutation.
    Graph-Scopes: DeviceManagementManagedDevices.Read.All, DeviceManagementManagedDevices.PrivilegedOperations.All.
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
- Dokumentierte Graph-Scopes: DeviceManagementManagedDevices.Read.All, DeviceManagementManagedDevices.PrivilegedOperations.All
- Hilfsdateien: Keine lokale Hilfsdatei erkannt.

## Verwendung

```powershell
./01_Device_Management/02_Restart-IntuneDevice.ps1 -DeviceId "managed-device-id" -WhatIf
```

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/01_Device_Management/02_Restart-IntuneDevice.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
