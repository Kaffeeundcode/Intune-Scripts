# Get-IntuneTenantOperationAudit

**Prüfstatus: Ungeprüft**

Erstellt einen operativen Tenant-Audit.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Aggregiert Konfigurationsobjekte, Apps, Geraete und Scope-Tags zu einer operativen
    Gesamtuebersicht.

## Prüfung

Keine fachliche Freigabe aus der Katalogerstellung ableiten.

- static: aktueller erfolgreicher Nachweis fehlt
- pester: aktueller erfolgreicher Nachweis fehlt
- windows: aktueller erfolgreicher Nachweis fehlt
- tenant: aktueller erfolgreicher Nachweis fehlt

## Voraussetzungen

- Module: Microsoft.Graph.Authentication
- Dokumentierte Graph-Scopes: DeviceManagementConfiguration.Read.All, DeviceManagementApps.Read.All, DeviceManagementManagedDevices.Read.All, DeviceManagementRBAC.Read.All
- Hilfsdateien: Keine lokale Hilfsdatei erkannt.

## Verwendung

```powershell
./29_Intune_Operational_Audit/416_Get-IntuneTenantOperationAudit.ps1 -OutputPath './reports/tenant-operation-audit.csv'
```

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/29_Intune_Operational_Audit/416_Get-IntuneTenantOperationAudit.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
