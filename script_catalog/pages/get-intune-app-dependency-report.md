# Get-IntuneAppDependencyReport

**Prüfstatus: Ungeprüft**

Berichtet Abhaengigkeiten zwischen Intune-Apps.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Listet Apps mit dependentAppCount oder supersededAppCount. Diese Werte geben einen
    Hinweis auf verschachtelte Verteilungslogik und Supersedence-Ketten.

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
./19_App_Ecosystem/378_Get-IntuneAppDependencyReport.ps1 -OutputPath './reports/app-dependencies.csv'
```

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/19_App_Ecosystem/378_Get-IntuneAppDependencyReport.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
