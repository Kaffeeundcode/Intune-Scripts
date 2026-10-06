# Get-IntuneDeviceAgeDistributionReport

**Prüfstatus: Ungeprüft**

Analysiert das Alter verwalteter Geraete.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Nutzt lastSyncDateTime als Hinweis auf Geraetealter und sortiert die Flotte in
    Altersklassen. Das Skript bewertet kein Ersatzbedarf.

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
./26_Lifecycle_Gaps/403_Get-IntuneDeviceAgeDistributionReport.ps1 -OutputPath './reports/device-age.csv'
```

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/26_Lifecycle_Gaps/403_Get-IntuneDeviceAgeDistributionReport.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
