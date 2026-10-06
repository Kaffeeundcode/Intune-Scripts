# Get-IntuneConfigurationChangeAudit

**Prüfstatus: Ungeprüft**

Listet letzte Konfigurationsaenderungen in Intune.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Liest Konfigurationsobjekte und sortiert sie nach lastModifiedDateTime. Das Skript
    erstellt einen Audit-Report, keinen Snapshot.

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
./25_Tenant_Operational_Health/402_Get-IntuneConfigurationChangeAudit.ps1 -OutputPath './reports/config-change-audit.csv'
```

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/25_Tenant_Operational_Health/402_Get-IntuneConfigurationChangeAudit.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
