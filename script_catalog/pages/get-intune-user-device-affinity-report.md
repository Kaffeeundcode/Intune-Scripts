# Get-IntuneUserDeviceAffinityReport

**Prüfstatus: Ungeprüft**

Erstellt eine User-Geraete-Affinitaet pro Tenant.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Ordnet Geraete ihrem gemeldeten Benutzer zu und bewertet die Affinitaet. Geraete ohne
    eindeutige Zuordnung werden markiert. Das Skript aendert keine Affinitaet.

## Prüfung

Keine fachliche Freigabe aus der Katalogerstellung ableiten.

- static: aktueller erfolgreicher Nachweis fehlt
- pester: aktueller erfolgreicher Nachweis fehlt
- windows: aktueller erfolgreicher Nachweis fehlt
- tenant: aktueller erfolgreicher Nachweis fehlt

## Voraussetzungen

- Module: Microsoft.Graph.Authentication
- Dokumentierte Graph-Scopes: DeviceManagementManagedDevices.Read.All, User.Read.All
- Hilfsdateien: Keine lokale Hilfsdatei erkannt.

## Verwendung

```powershell
./23_User_Device_Mapping/391_Get-IntuneUserDeviceAffinityReport.ps1 -OutputPath './reports/user-device-affinity.csv'
```

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/23_User_Device_Mapping/391_Get-IntuneUserDeviceAffinityReport.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
