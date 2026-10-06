# Get-IntuneComplianceGapReport

**Prüfstatus: Ungeprüft**

Findet Geraete mit Compliance-Luecken.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Listet Geraete, deren Compliance-State nicht OK ist, mit Betriebssystem und Sync-Datum.
    Das Skript bewertet nicht die Ursache der Nichtkonformitaet.

## Prüfung

Keine fachliche Freigabe aus der Katalogerstellung ableiten.

- static: aktueller erfolgreicher Nachweis fehlt
- pester: aktueller erfolgreicher Nachweis fehlt
- windows: aktueller erfolgreicher Nachweis fehlt
- tenant: aktueller erfolgreicher Nachweis fehlt

## Voraussetzungen

- Module: Microsoft.Graph.Authentication
- Dokumentierte Graph-Scopes: DeviceManagementManagedDevices.Read.All
- Hilfsdateien: Keine lokale Hilfsdatei erkannt.

## Verwendung

```powershell
./27_Policy_Gaps/407_Get-IntuneComplianceGapReport.ps1 -OutputPath './reports/compliance-gaps.csv'
```

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/27_Policy_Gaps/407_Get-IntuneComplianceGapReport.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
