# Get-IntuneScopeTagCoverageReport

**Prüfstatus: Ungeprüft**

Prueft die tatsaechliche Verwendung von Intune-Scope-Tags.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Listet Scope-Tags und zaehlt ihre Verwendung in Konfigurationen, Compliance-
    Richtlinien und Scripts. Tags ohne Treffer werden markiert.

## Prüfung

Keine fachliche Freigabe aus der Katalogerstellung ableiten.

- static: aktueller erfolgreicher Nachweis fehlt
- pester: aktueller erfolgreicher Nachweis fehlt
- windows: aktueller erfolgreicher Nachweis fehlt
- tenant: aktueller erfolgreicher Nachweis fehlt

## Voraussetzungen

- Module: Microsoft.Graph.Authentication
- Dokumentierte Graph-Scopes: DeviceManagementRBAC.Read.All, DeviceManagementConfiguration.Read.All
- Hilfsdateien: Keine lokale Hilfsdatei erkannt.

## Verwendung

```powershell
./22_Governance/388_Get-IntuneScopeTagCoverageReport.ps1 -OutputPath './reports/scope-tag-coverage.csv'
```

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/22_Governance/388_Get-IntuneScopeTagCoverageReport.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
