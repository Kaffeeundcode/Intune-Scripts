# Assign-AppToGroup_Required

**Prüfstatus: Ungeprüft**

Weist eine App einer Gruppe als 'Erforderlich' (Required) zu.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Abfrage ueber Graph beta mit Fehlerabbruch und strukturierten Ergebnissen. Aenderungen unterstuetzen -WhatIf.
    Graph-Scopes: DeviceManagementApps.ReadWrite.All.
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
- Dokumentierte Graph-Scopes: DeviceManagementApps.ReadWrite.All
- Hilfsdateien: Keine lokale Hilfsdatei erkannt.

## Verwendung

```powershell
./02_App_Management/14_Assign-AppToGroup_Required.ps1 -AppId "object-id" -GroupId "object-id" -WhatIf
```

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/02_App_Management/14_Assign-AppToGroup_Required.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
