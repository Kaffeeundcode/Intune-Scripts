# Get-IntuneUpdateComplianceGapReport

**Prüfstatus: Ungeprüft**

Analysiert Update-Richtlinien ohne Zuweisung.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Filtert Update-Richtlinien aus den Konfigurationsobjekten und prueft deren
    Zuweisung. Das Skript bewertet nicht, ob Geraete Updates installiert haben.

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
./27_Policy_Gaps/410_Get-IntuneUpdateComplianceGapReport.ps1 -OutputPath './reports/update-policy-gaps.csv'
```

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/27_Policy_Gaps/410_Get-IntuneUpdateComplianceGapReport.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
