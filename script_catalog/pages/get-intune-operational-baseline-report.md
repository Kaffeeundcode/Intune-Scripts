# Get-IntuneOperationalBaselineReport

**Prüfstatus: Ungeprüft**

Erzeugt einen operativen Baselinereport.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Aggregiert Geraete-, App-, Konfigurations- und Scope-Tag-Anzahlen zu einer Baseline.
    Das Skript bewertet keine Compliance.

## Prüfung

Keine fachliche Freigabe aus der Katalogerstellung ableiten.

- static: aktueller erfolgreicher Nachweis fehlt
- pester: aktueller erfolgreicher Nachweis fehlt
- windows: aktueller erfolgreicher Nachweis fehlt
- tenant: aktueller erfolgreicher Nachweis fehlt

## Voraussetzungen

- Module: Microsoft.Graph.Authentication
- Dokumentierte Graph-Scopes: DeviceManagementManagedDevices.Read.All, DeviceManagementApps.Read.All, DeviceManagementConfiguration.Read.All, DeviceManagementRBAC.Read.All
- Hilfsdateien: Keine lokale Hilfsdatei erkannt.

## Verwendung

```powershell
./29_Intune_Operational_Audit/418_Get-IntuneOperationalBaselineReport.ps1 -OutputPath './reports/operational-baseline.csv'
```

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/29_Intune_Operational_Audit/418_Get-IntuneOperationalBaselineReport.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
