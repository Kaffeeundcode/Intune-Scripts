# Get-IntuneBitLockerComplianceGapReport

**Prüfstatus: Ungeprüft**

Prueft BitLocker-Richtlinien auf Zuweisungsluecken.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Filtert BitLocker-Richtlinien und markiert unzugeordnete Objekte. Das Skript prueft
    keine lokalen Verschluesselungszustaende.

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
./31_Intune_Security_Compliance_Gaps/425_Get-IntuneBitLockerComplianceGapReport.ps1 -OutputPath './reports/bitlocker-gaps.csv'
```

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/31_Intune_Security_Compliance_Gaps/425_Get-IntuneBitLockerComplianceGapReport.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
