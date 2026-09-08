# Get-IntuneDeviceStalenessScore

**Prüfstatus: Ungeprüft**

Calculates a "Staleness Score" for devices to help identify candidates for cleanup.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Devices are scored based on:
    - Last Check-in date (More than 30/60/90 days)
    - OS Version Lag (Is it an old build?)
    - Compliance State

    A high score indicates a device that is likely abandoned or broken.

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

Noch kein geprüftes Aufrufbeispiel dokumentiert. Parameter mit `Get-Help './16_Mixed_New_Scripts/106_Get-IntuneDeviceStalenessScore.ps1' -Full` lesen.

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/16_Mixed_New_Scripts/106_Get-IntuneDeviceStalenessScore.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
