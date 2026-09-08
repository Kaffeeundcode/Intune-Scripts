# Get-DeviceEncryptionStatus

**Prüfstatus: Ungeprüft**

Prüft Verschlüsselungsstatus aller Geräte.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Listet Geräte auf, die nicht verschlüsselt sind.
    Erfordert die Berechtigung 'DeviceManagementManagedDevices.Read.All'.

## Prüfung

Keine fachliche Freigabe aus der Katalogerstellung ableiten.

- static: aktueller erfolgreicher Nachweis fehlt
- pester: aktueller erfolgreicher Nachweis fehlt
- windows: aktueller erfolgreicher Nachweis fehlt
- tenant: aktueller erfolgreicher Nachweis fehlt

## Voraussetzungen

- Module: Microsoft.Graph.Authentication, Microsoft.Graph (passende SDK-Untermodule)
- Dokumentierte Graph-Scopes: DeviceManagementManagedDevices.Read.All
- Hilfsdateien: Keine lokale Hilfsdatei erkannt.

## Verwendung

Noch kein geprüftes Aufrufbeispiel dokumentiert. Parameter mit `Get-Help './06_Monitoring_Reporting/56_Get-DeviceEncryptionStatus.ps1' -Full` lesen.

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/06_Monitoring_Reporting/56_Get-DeviceEncryptionStatus.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
