# Get-IntuneAutomationReadinessReport

**Prüfstatus: Ungeprüft**

Prueft die operative Bereitschaft fuer Automation.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Bewertet Geraete, Apps, Richtlinien und Connectoren fuer Automatisierungsvorhaben.
    Ziel ist die Kontrolle, ob grundlegende Objekte vorhanden sind.

## Prüfung

Keine fachliche Freigabe aus der Katalogerstellung ableiten.

- static: aktueller erfolgreicher Nachweis fehlt
- pester: aktueller erfolgreicher Nachweis fehlt
- windows: aktueller erfolgreicher Nachweis fehlt
- tenant: aktueller erfolgreicher Nachweis fehlt

## Voraussetzungen

- Module: Microsoft.Graph.Authentication
- Dokumentierte Graph-Scopes: DeviceManagementManagedDevices.Read.All, DeviceManagementApps.Read.All, DeviceManagementConfiguration.Read.All
- Hilfsdateien: Keine lokale Hilfsdatei erkannt.

## Verwendung

```powershell
./25_Tenant_Operational_Health/401_Get-IntuneAutomationReadinessReport.ps1 -OutputPath './reports/automation-readiness.csv'
```

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/25_Tenant_Operational_Health/401_Get-IntuneAutomationReadinessReport.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
