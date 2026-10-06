# Get-IntuneAppConfigurationPolicyExport

**Prüfstatus: Ungeprüft**

Exportiert Intune-App-Konfigurationsrichtlinien als JSON.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Liest alle targetedManagedAppConfigurations und exportiert die vollstaendige
    JSON-Struktur. Diese Ausgabe kann als Migration- oder Backup-Quelle dienen.

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
./19_App_Ecosystem/376_Get-IntuneAppConfigurationPolicyExport.ps1 -OutputPath './reports/app-configuration-export.json'
```

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/19_App_Ecosystem/376_Get-IntuneAppConfigurationPolicyExport.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
