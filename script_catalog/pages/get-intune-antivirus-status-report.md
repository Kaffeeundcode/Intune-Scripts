# Get-IntuneAntivirusStatusReport

**Prüfstatus: Ungeprüft**

Exportiert ungesunde Defender-Agenten aus Intune.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Nutzt den offiziellen Intune-Exportreport UnhealthyDefenderAgents und markiert
    alle Zeilen als auffaellig. Das Skript startet keine lokale Defender-Aktion.

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
./21_Security_Deep_Dive/384_Get-IntuneAntivirusStatusReport.ps1 -OutputPath './reports/unhealthy-defender-agents.csv'
```

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/21_Security_Deep_Dive/384_Get-IntuneAntivirusStatusReport.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
