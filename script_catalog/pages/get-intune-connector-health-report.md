# Get-IntuneConnectorHealthReport

**Prüfstatus: Ungeprüft**

Prueft Apple-, Android- und Intune-Connector-Zustaende.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Kombiniert APNs-Zertifikat, VPP-Tokens, ADE-Tokens und Android-Bindung in einem
    Report. Ablaufdatum und Sync-Fehler werden separat ausgewertet.

## Prüfung

Keine fachliche Freigabe aus der Katalogerstellung ableiten.

- static: aktueller erfolgreicher Nachweis fehlt
- pester: aktueller erfolgreicher Nachweis fehlt
- windows: aktueller erfolgreicher Nachweis fehlt
- tenant: aktueller erfolgreicher Nachweis fehlt

## Voraussetzungen

- Module: Microsoft.Graph.Authentication
- Dokumentierte Graph-Scopes: DeviceManagementServiceConfig.Read.All, DeviceManagementApps.Read.All
- Hilfsdateien: Keine lokale Hilfsdatei erkannt.

## Verwendung

```powershell
./22_Governance/389_Get-IntuneConnectorHealthReport.ps1 -OutputPath './reports/connector-health.csv'
```

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/22_Governance/389_Get-IntuneConnectorHealthReport.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
