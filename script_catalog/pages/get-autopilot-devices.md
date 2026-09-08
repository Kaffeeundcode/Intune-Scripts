# Get-AutopilotDevices

**Prüfstatus: Ungeprüft**

Listet alle Windows Autopilot Geräte auf.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Ruft registrierte Autopilot-Devices ab (Serial Number, Model, Profile Status).
    Erfordert die Berechtigung 'DeviceManagementServiceConfig.Read.All'.

## Prüfung

Keine fachliche Freigabe aus der Katalogerstellung ableiten.

- static: aktueller erfolgreicher Nachweis fehlt
- pester: aktueller erfolgreicher Nachweis fehlt
- windows: aktueller erfolgreicher Nachweis fehlt
- tenant: aktueller erfolgreicher Nachweis fehlt

## Voraussetzungen

- Module: Microsoft.Graph.Authentication, Microsoft.Graph (passende SDK-Untermodule)
- Dokumentierte Graph-Scopes: DeviceManagementServiceConfig.Read.All
- Hilfsdateien: Keine lokale Hilfsdatei erkannt.

## Verwendung

Noch kein geprüftes Aufrufbeispiel dokumentiert. Parameter mit `Get-Help './05_Enrollment_Autopilot/41_Get-AutopilotDevices.ps1' -Full` lesen.

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/05_Enrollment_Autopilot/41_Get-AutopilotDevices.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
