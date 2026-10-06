# Get-IntuneAppDeploymentAudit

**Prüfstatus: Ungeprüft**

Analysiert Zuweisungen und Verteilung von Intune-Apps.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Listet Apps mit keiner, breiter oder gruppenbasierter Zuweisung. Das Skript liest
    mobileApps mit expand=assignments und bewertet die Zuweisungsstruktur.

## Prüfung

Keine fachliche Freigabe aus der Katalogerstellung ableiten.

- static: aktueller erfolgreicher Nachweis fehlt
- pester: aktueller erfolgreicher Nachweis fehlt
- windows: aktueller erfolgreicher Nachweis fehlt
- tenant: aktueller erfolgreicher Nachweis fehlt

## Voraussetzungen

- Module: Microsoft.Graph.Authentication
- Dokumentierte Graph-Scopes: DeviceManagementApps.Read.All
- Hilfsdateien: Keine lokale Hilfsdatei erkannt.

## Verwendung

```powershell
./19_App_Ecosystem/377_Get-IntuneAppDeploymentAudit.ps1 -OutputPath './reports/app-deployment-audit.csv'
```

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/19_App_Ecosystem/377_Get-IntuneAppDeploymentAudit.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
