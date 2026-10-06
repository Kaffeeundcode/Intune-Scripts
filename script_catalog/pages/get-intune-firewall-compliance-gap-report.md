# Get-IntuneFirewallComplianceGapReport

**Prüfstatus: Ungeprüft**

Prueft Firewall-Richtlinien auf Zuweisungsluecken.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Filtert Firewall-Richtlinien und markiert unzugeordnete Objekte. Das Skript testet
    keine lokalen Firewall-Profile.

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
./31_Intune_Security_Compliance_Gaps/423_Get-IntuneFirewallComplianceGapReport.ps1 -OutputPath './reports/firewall-gaps.csv'
```

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/31_Intune_Security_Compliance_Gaps/423_Get-IntuneFirewallComplianceGapReport.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
