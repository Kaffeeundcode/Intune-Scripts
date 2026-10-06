# Get-IntuneAppControlDeploymentReport

**Prüfstatus: Ungeprüft**

Meldet Bereitstellungsprobleme von Intune App Control for Business.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Verwendet DeviceAssignmentStatusByConfigurationPolicyForAC fuer den geraetebezogenen
    App-Control-Zuweisungsstatus. Fehler und Konflikte sind Auffaellig, noch nicht
    abgeschlossene oder unbekannte Zustaende bleiben Nicht pruefbar. Der Report bewertet
    keine lokalen WDAC-Ereignisprotokolle und keine fachliche Eignung der Richtlinie.

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
./17_Intune_Workflows/368_Get-IntuneAppControlDeploymentReport.ps1 -OutputPath './reports/app-control.csv'
```

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/17_Intune_Workflows/368_Get-IntuneAppControlDeploymentReport.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
