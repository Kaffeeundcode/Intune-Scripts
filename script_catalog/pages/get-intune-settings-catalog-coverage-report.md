# Get-IntuneSettingsCatalogCoverageReport

**Prüfstatus: Ungeprüft**

Vergleicht Settings-Catalog- und Group-Policy-Abdeckung.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Listet Konfigurationsfamilien mit Anzahl, Zuweisungsanzahl und Filterverwendung.
    Ziel ist eine schnellen Uebersicht ueber ADMX- und Settings-Catalog-Nutzung.

## Prüfung

Keine fachliche Freigabe aus der Katalogerstellung ableiten.

- static: aktueller erfolgreicher Nachweis fehlt
- pester: aktueller erfolgreicher Nachweis fehlt
- windows: aktueller erfolgreicher Nachweis fehlt
- tenant: aktueller erfolgreicher Nachweis fehlt

## Voraussetzungen

- Module: Microsoft.Graph.Authentication
- Dokumentierte Graph-Scopes: DeviceManagementConfiguration.Read.All, DeviceManagementManagedDevices.Read.All
- Hilfsdateien: Keine lokale Hilfsdatei erkannt.

## Verwendung

```powershell
./20_Policy_Hygiene/381_Get-IntuneSettingsCatalogCoverageReport.ps1 -OutputPath './reports/settings-catalog-coverage.csv'
```

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/20_Policy_Hygiene/381_Get-IntuneSettingsCatalogCoverageReport.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
