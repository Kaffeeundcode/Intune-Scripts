# Get-IntuneTenantOperationalHealthReport

**Prüfstatus: Ungeprüft**

Erstellt einen Tenant-Gesamtzustands-Report.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Aggregiert Geraete, Richtlinien, Apps, Zuweisungen und Scope-Tags in einem Report.
    Das Skript bewertet nur Konfigurations- und Zuweisungszustaende, keine Cloud-Verfuegbarkeit.

## Prüfung

Keine fachliche Freigabe aus der Katalogerstellung ableiten.

- static: aktueller erfolgreicher Nachweis fehlt
- pester: aktueller erfolgreicher Nachweis fehlt
- windows: aktueller erfolgreicher Nachweis fehlt
- tenant: aktueller erfolgreicher Nachweis fehlt

## Voraussetzungen

- Module: Microsoft.Graph.Authentication
- Dokumentierte Graph-Scopes: DeviceManagementManagedDevices.Read.All, DeviceManagementConfiguration.Read.All, DeviceManagementApps.Read.All, DeviceManagementRBAC.Read.All
- Hilfsdateien: Keine lokale Hilfsdatei erkannt.

## Verwendung

```powershell
./25_Tenant_Operational_Health/399_Get-IntuneTenantOperationalHealthReport.ps1 -OutputPath './reports/tenant-health.csv'
```

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/25_Tenant_Operational_Health/399_Get-IntuneTenantOperationalHealthReport.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
