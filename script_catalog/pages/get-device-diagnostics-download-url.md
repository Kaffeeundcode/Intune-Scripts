# Get-DeviceDiagnosticsDownloadUrl

**Prüfstatus: Ungeprüft**

Holt Download-URL für Diagnoseprotokolle.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Wenn 'Collect Diagnostics' fertig ist, kann hier die URL abgerufen werden.
    Erfordert die Berechtigung 'DeviceManagementManagedDevices.Read.All'.

## Prüfung

Keine fachliche Freigabe aus der Katalogerstellung ableiten.

- static: aktueller erfolgreicher Nachweis fehlt
- pester: aktueller erfolgreicher Nachweis fehlt
- windows: aktueller erfolgreicher Nachweis fehlt
- tenant: aktueller erfolgreicher Nachweis fehlt

## Voraussetzungen

- Module: Skript prüfen; keine Cloud-Module erkannt.
- Dokumentierte Graph-Scopes: DeviceManagementManagedDevices.Read.All
- Hilfsdateien: Keine lokale Hilfsdatei erkannt.

## Verwendung

Noch kein geprüftes Aufrufbeispiel dokumentiert. Parameter mit `Get-Help './08_Troubleshooting_Cleanup/72_Get-DeviceDiagnosticsDownloadUrl.ps1' -Full` lesen.

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/08_Troubleshooting_Cleanup/72_Get-DeviceDiagnosticsDownloadUrl.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
