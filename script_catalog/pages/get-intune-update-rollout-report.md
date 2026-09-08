# Get-IntuneUpdateRolloutReport

**Prüfstatus: Ungeprüft**

Verbindet Windows-Inventar mit dem gemeldeten Bereitstellungsstatus klassischer Update-Ringe.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Liest windowsUpdateForBusinessConfiguration-Profile und deren deviceStatuses. Ein erfolgreicher Richtlinienstatus
    belegt nicht die Installation eines bestimmten KB-Updates. Feature-/Quality-Update-Reports und Settings-Catalog-Ringe sind nicht enthalten.

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
./17_Intune_Workflows/358_Get-IntuneUpdateRolloutReport.ps1 -OutputPath './reports/update-rings.json'
```

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/17_Intune_Workflows/358_Get-IntuneUpdateRolloutReport.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
