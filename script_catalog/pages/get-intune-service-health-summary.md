# Get-IntuneServiceHealthSummary

**Prüfstatus: Ungeprüft**

Fasst Intune-Dienst- und Konfigurationsgesundheit zusammen.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Prueft Connector-, Lizenz- und Konfigurationszustaende als Proxy fuer die operationale
    Gesundheit. Das Skript ruft keinen externen Service-Health-Feed ab.

## Prüfung

Keine fachliche Freigabe aus der Katalogerstellung ableiten.

- static: aktueller erfolgreicher Nachweis fehlt
- pester: aktueller erfolgreicher Nachweis fehlt
- windows: aktueller erfolgreicher Nachweis fehlt
- tenant: aktueller erfolgreicher Nachweis fehlt

## Voraussetzungen

- Module: Microsoft.Graph.Authentication
- Dokumentierte Graph-Scopes: DeviceManagementServiceConfig.Read.All, DeviceManagementApps.Read.All, DeviceManagementConfiguration.Read.All
- Hilfsdateien: Keine lokale Hilfsdatei erkannt.

## Verwendung

```powershell
./25_Tenant_Operational_Health/400_Get-IntuneServiceHealthSummary.ps1 -OutputPath './reports/service-health-summary.csv'
```

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/25_Tenant_Operational_Health/400_Get-IntuneServiceHealthSummary.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
