# Get-IntunePolicyAssignmentGapReport

**Prüfstatus: Ungeprüft**

Findet Richtlinien ohne Zuweisung.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Prueft Geraete-, Compliance- und Konfigurationsrichtlinien auf fehlende Zuweisung.
    Das Skript ist ein gezielter Lueckenreport und kein allgemeiner Snapshot.

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
./27_Policy_Gaps/409_Get-IntunePolicyAssignmentGapReport.ps1 -OutputPath './reports/policy-assignment-gaps.csv'
```

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/27_Policy_Gaps/409_Get-IntunePolicyAssignmentGapReport.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
