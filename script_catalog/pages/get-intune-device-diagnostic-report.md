# Get-IntuneDeviceDiagnosticReport

**Prüfstatus: Ungeprüft**

Erstellt einen zusammenhaengenden Intune-Diagnosebericht fuer ein Geraet.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Liest Geraet, Compliance, klassische Konfigurationszustaende und App-Installationszustaende.
    Einzelne nicht verfuegbare Datenquellen erscheinen als Nicht pruefbar. Kein fehlerhafter Abruf wird als gesund gewertet.
    Settings-Catalog-Per-Setting-Reports sind nicht Bestandteil der klassischen deviceConfigurationStates.

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
./17_Intune_Workflows/351_Get-IntuneDeviceDiagnosticReport.ps1 -DeviceName 'TEST-PC' -OutputPath './reports/device.json'
```

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/17_Intune_Workflows/351_Get-IntuneDeviceDiagnosticReport.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
