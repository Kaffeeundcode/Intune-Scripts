# Get-IntuneLifecycleSummary

**Prüfstatus: Ungeprüft**

Fasst Geraeteverteilung und Sync-Zustaende zusammen.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Aggregiert Betriebssystem, Management-Zustand und Sync-Aktualitaet. Das Skript
    bewertet keine Hardwarequalitaet.

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
./26_Lifecycle_Gaps/405_Get-IntuneLifecycleSummary.ps1 -OutputPath './reports/lifecycle-summary.csv'
```

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/26_Lifecycle_Gaps/405_Get-IntuneLifecycleSummary.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
