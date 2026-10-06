# Get-IntunePolicyDeploymentStatusReport

**Prüfstatus: Ungeprüft**

Bewertet die Zuweisung von Konfigurationsrichtlinien.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Listet Richtlinien mit Zuweisungsanzahl und bewertet, ob sie unzugeordnet sind.

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
./29_Intune_Operational_Audit/417_Get-IntunePolicyDeploymentStatusReport.ps1 -OutputPath './reports/policy-deployment-status.csv'
```

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/29_Intune_Operational_Audit/417_Get-IntunePolicyDeploymentStatusReport.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
