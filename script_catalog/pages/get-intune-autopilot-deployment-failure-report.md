# Get-IntuneAutopilotDeploymentFailureReport

**Prüfstatus: Ungeprüft**

Fasst fehlgeschlagene Windows-Autopilot-Bereitstellungen zusammen.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Verknuepft die offiziellen Autopilot-V1- und Autopilot-V2-Exportreports mit den
    V2-Detailreports fuer Apps und Skripte. Es werden nur klar gemeldete Fehler- und
    Abbruchzustaende ausgegeben. Ein leerer Report belegt keine generelle Autopilot-
    Bereitschaft, sondern nur, dass die Exportreports keine Fehlerzeile geliefert haben.

## Prüfung

Keine fachliche Freigabe aus der Katalogerstellung ableiten.

- static: aktueller erfolgreicher Nachweis fehlt
- pester: aktueller erfolgreicher Nachweis fehlt
- windows: aktueller erfolgreicher Nachweis fehlt
- tenant: aktueller erfolgreicher Nachweis fehlt

## Voraussetzungen

- Module: Microsoft.Graph.Authentication
- Dokumentierte Graph-Scopes: DeviceManagementManagedDevices.Read.All, DeviceManagementServiceConfig.Read.All
- Hilfsdateien: Keine lokale Hilfsdatei erkannt.

## Verwendung

```powershell
./17_Intune_Workflows/361_Get-IntuneAutopilotDeploymentFailureReport.ps1 -OutputPath './reports/autopilot-failures.json'
```

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/17_Intune_Workflows/361_Get-IntuneAutopilotDeploymentFailureReport.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
