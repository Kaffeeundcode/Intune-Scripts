# Resolve-IntuneAssignmentForDevice

**Prüfstatus: Ungeprüft**

Erklaert Gruppen-, Benutzer- und Filterbezug einer Intune-Zuweisung.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Prueft ein konkretes Objekt gegen direkte Entra-Gruppenmitgliedschaften. UserId ist der zu untersuchende Benutzerkontext.
    Ein Treffer belegt Zielgruppenzugehoerigkeit, nicht erfolgreiche Installation. Zuweisungsfilter werden mit Regel ausgegeben,
    aber nicht lokal nachgebildet. Benutzer- und Geraeteausschluesse bleiben getrennt; unbekannte Zieltypen werden nicht bewertet.

## Prüfung

Keine fachliche Freigabe aus der Katalogerstellung ableiten.

- static: aktueller erfolgreicher Nachweis fehlt
- pester: aktueller erfolgreicher Nachweis fehlt
- windows: aktueller erfolgreicher Nachweis fehlt
- tenant: aktueller erfolgreicher Nachweis fehlt

## Voraussetzungen

- Module: Microsoft.Graph.Authentication
- Dokumentierte Graph-Scopes: DeviceManagementManagedDevices.Read.All, DeviceManagementApps.Read.All, DeviceManagementConfiguration.Read.All, Device.Read.All, Group.Read.All, User.Read.All
- Hilfsdateien: Keine lokale Hilfsdatei erkannt.

## Verwendung

```powershell
./17_Intune_Workflows/352_Resolve-IntuneAssignmentForDevice.ps1 -DeviceId 'managed-device-id' -ResourceType mobileApps -ResourceId 'app-id' -OutputPath './reports/assignments.json'
```

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/17_Intune_Workflows/352_Resolve-IntuneAssignmentForDevice.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
