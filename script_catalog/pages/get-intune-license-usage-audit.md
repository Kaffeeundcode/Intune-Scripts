# Get-IntuneLicenseUsageAudit

**Prüfstatus: Ungeprüft**

Prueft Intune-Lizenzen gegen tatsaechliche Geraetenutzung.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Listet Benutzer mit Intune-Lizenzen, die keinem verwalteten Geraet zugeordnet sind.
    Das Skript aendert keine Lizenz und bewertet keine Berechtigung.

## Prüfung

Keine fachliche Freigabe aus der Katalogerstellung ableiten.

- static: aktueller erfolgreicher Nachweis fehlt
- pester: aktueller erfolgreicher Nachweis fehlt
- windows: aktueller erfolgreicher Nachweis fehlt
- tenant: aktueller erfolgreicher Nachweis fehlt

## Voraussetzungen

- Module: Microsoft.Graph.Authentication
- Dokumentierte Graph-Scopes: DeviceManagementManagedDevices.Read.All, User.Read.All
- Hilfsdateien: Keine lokale Hilfsdatei erkannt.

## Verwendung

```powershell
./22_Governance/387_Get-IntuneLicenseUsageAudit.ps1 -OutputPath './reports/license-usage.csv'
```

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/22_Governance/387_Get-IntuneLicenseUsageAudit.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
