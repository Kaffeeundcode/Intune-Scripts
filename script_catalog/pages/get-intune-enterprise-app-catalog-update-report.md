# Get-IntuneEnterpriseAppCatalogUpdateReport

**Prüfstatus: Ungeprüft**

Listet verfuegbare Updates fuer Intune Enterprise App Catalog Apps.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Liest CatalogAppsUpdateList und zeigt aktuelle sowie neu verfuegbare Versionen,
    Updateberechtigung und Supersedence-Status. Das Skript fuehrt keine Aktualisierung
    aus. Enterprise App Management muss im Tenant lizenziert sein.

## Prüfung

Keine fachliche Freigabe aus der Katalogerstellung ableiten.

- static: aktueller erfolgreicher Nachweis fehlt
- pester: aktueller erfolgreicher Nachweis fehlt
- windows: aktueller erfolgreicher Nachweis fehlt
- tenant: aktueller erfolgreicher Nachweis fehlt

## Voraussetzungen

- Module: Microsoft.Graph.Authentication
- Dokumentierte Graph-Scopes: DeviceManagementApps.Read.All
- Hilfsdateien: Keine lokale Hilfsdatei erkannt.

## Verwendung

```powershell
./17_Intune_Workflows/369_Get-IntuneEnterpriseAppCatalogUpdateReport.ps1 -OutputPath './reports/eam-updates.csv'
```

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/17_Intune_Workflows/369_Get-IntuneEnterpriseAppCatalogUpdateReport.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
