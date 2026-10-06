# Get-IntuneAuditLogCoverageReport

**Prüfstatus: Ungeprüft**

Prueft die Abdeckung von Intune-Auditdaten.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Vergleicht die Anzahl Konfigurationsobjekte mit den lesbaren letzten Aenderungen.
    Ziel ist eine Aussage zur Auditabdeckung im Tenant.

## Prüfung

Keine fachliche Freigabe aus der Katalogerstellung ableiten.

- static: aktueller erfolgreicher Nachweis fehlt
- pester: aktueller erfolgreicher Nachweis fehlt
- windows: aktueller erfolgreicher Nachweis fehlt
- tenant: aktueller erfolgreicher Nachweis fehlt

## Voraussetzungen

- Module: Microsoft.Graph.Authentication
- Dokumentierte Graph-Scopes: DeviceManagementConfiguration.Read.All
- Hilfsdateien: Keine lokale Hilfsdatei erkannt.

## Verwendung

```powershell
./29_Intune_Operational_Audit/415_Get-IntuneAuditLogCoverageReport.ps1 -OutputPath './reports/audit-log-coverage.csv'
```

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/29_Intune_Operational_Audit/415_Get-IntuneAuditLogCoverageReport.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
