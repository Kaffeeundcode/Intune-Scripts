# Get-IntuneAntivirusComplianceGapReport

**Prüfstatus: Ungeprüft**

Prueft Antivirus-Richtlinien auf Zuweisungsluecken.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Filtert Antivirus-Richtlinien und markiert unzugeordnete Objekte. Das Skript prueft
    keine lokalen Virenscans.

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
./31_Intune_Security_Compliance_Gaps/424_Get-IntuneAntivirusComplianceGapReport.ps1 -OutputPath './reports/antivirus-gaps.csv'
```

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/31_Intune_Security_Compliance_Gaps/424_Get-IntuneAntivirusComplianceGapReport.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
