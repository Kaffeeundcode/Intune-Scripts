# Get-IntuneAppInstallFailureSummary

**Prüfstatus: Ungeprüft**

Zeigt Intune-Apps mit fehlgeschlagenen Installationen.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Nutzt AppInstallStatusAggregate fuer eine mandantenweite Fehleruebersicht. Mit
    IncludeDeviceDetails werden fuer jede betroffene App zusaetzlich die Geraetezeilen
    aus DeviceInstallStatusByApp geladen. Das kann in grossen Tenants viele Exportjobs
    erzeugen und ist deshalb standardmaessig deaktiviert.

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
./17_Intune_Workflows/363_Get-IntuneAppInstallFailureSummary.ps1 -MinimumFailedDevicePercentage 5 -OutputPath './reports/app-failures.csv'
```

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/17_Intune_Workflows/363_Get-IntuneAppInstallFailureSummary.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
