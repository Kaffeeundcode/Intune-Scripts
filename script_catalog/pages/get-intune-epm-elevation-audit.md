# Get-IntuneEpmElevationAudit

**Prüfstatus: Ungeprüft**

Exportiert Ereignisse aus Intune Endpoint Privilege Management.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Liest den offiziellen EPM-Elevation-Event-Report und begrenzt ihn lokal auf den
    gewaehlten Zeitraum. Abgelehnte oder fehlgeschlagene Elevations werden als
    Auffaellig markiert. EPM und die Reportberechtigung EpmPolicy.ViewReports muessen
    im Tenant lizenziert und fuer die angemeldete Rolle freigegeben sein.

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
./17_Intune_Workflows/367_Get-IntuneEpmElevationAudit.ps1 -Days 14 -OnlyFindings -OutputPath './reports/epm-events.csv'
```

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/17_Intune_Workflows/367_Get-IntuneEpmElevationAudit.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
