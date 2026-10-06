# Get-IntuneWindowsSecurityBaselineReport

**Prüfstatus: Ungeprüft**

Listet Windows-Sicherheitsbaseline-Richtlinien.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Filtert Geraetekonfigurationen nach Sicherheitsbaseline-Typen und listet Name,
    Version und Zuweisungsanzahl.

## Prüfung

Keine fachliche Freigabe aus der Katalogerstellung ableiten.

- static: aktueller erfolgreicher Nachweis fehlt
- pester: aktueller erfolgreicher Nachweis fehlt
- windows: aktueller erfolgreicher Nachweis fehlt
- tenant: aktueller erfolgreicher Nachweis fehlt

## Voraussetzungen

- Module: Microsoft.Graph.Authentication
- Dokumentierte Graph-Scopes: DeviceManagementConfiguration.Read.All, DeviceManagementManagedDevices.Read.All
- Hilfsdateien: Keine lokale Hilfsdatei erkannt.

## Verwendung

```powershell
./21_Security_Deep_Dive/383_Get-IntuneWindowsSecurityBaselineReport.ps1 -OutputPath './reports/security-baselines.csv'
```

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/21_Security_Deep_Dive/383_Get-IntuneWindowsSecurityBaselineReport.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
