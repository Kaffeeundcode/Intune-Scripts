# Set-DevicePrimaryUser

**Prüfstatus: Ungeprüft**

Setzt oder ändert den primären Benutzer eines Intune-Geräts.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Setzt die Primaerbenutzer-Referenz (Graph beta). Bereits passende Zuordnung bleibt unveraendert. Plattformunterstuetzung vorab pruefen.
    Graph-Scopes: DeviceManagementManagedDevices.ReadWrite.All, User.Read.All.
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
- Dokumentierte Graph-Scopes: DeviceManagementManagedDevices.ReadWrite.All, User.Read.All
- Hilfsdateien: Keine lokale Hilfsdatei erkannt.

## Verwendung

```powershell
./01_Device_Management/08_Set-DevicePrimaryUser.ps1 -DeviceName "TEST-PC" -UserPrincipalName "test@example.com" -WhatIf
```

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/01_Device_Management/08_Set-DevicePrimaryUser.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
