# Get-IntuneWindowsUpdateFailureReport

**Prüfstatus: Ungeprüft**

Exportiert Fehler aus Feature-, Quality- und Treiberupdates.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Liest die offiziellen Intune-Statusreports fuer Feature Updates, beschleunigte
    Quality Updates und Treiberupdates. Detailreports werden nur fuer Richtlinien mit
    gemeldeten Fehlern gestartet. Treiber mit manuellem Pruefbedarf werden als auffaellig
    ausgegeben. Klassische Update-Ringe sind weiterhin im separaten Rollout-Report enthalten.

## Prüfung

Keine fachliche Freigabe aus der Katalogerstellung ableiten.

- static: aktueller erfolgreicher Nachweis fehlt
- pester: aktueller erfolgreicher Nachweis fehlt
- windows: aktueller erfolgreicher Nachweis fehlt
- tenant: aktueller erfolgreicher Nachweis fehlt

## Voraussetzungen

- Module: Microsoft.Graph.Authentication
- Dokumentierte Graph-Scopes: DeviceManagementManagedDevices.Read.All, DeviceManagementConfiguration.Read.All
- Hilfsdateien: Keine lokale Hilfsdatei erkannt.

## Verwendung

```powershell
./17_Intune_Workflows/362_Get-IntuneWindowsUpdateFailureReport.ps1 -OutputPath './reports/windows-update-failures.csv'
```

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/17_Intune_Workflows/362_Get-IntuneWindowsUpdateFailureReport.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
