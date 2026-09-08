# Get-DeviceConfigStatus

**Prüfstatus: Ungeprüft**

Zeigt den Status von Konfigurationsprofilen auf einem Gerät.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Analysiert, welche Config-Profile erfolgreich angewendet wurden oder Fehler melden.
    Erfordert die Berechtigung 'DeviceManagementConfiguration.Read.All'.

## Prüfung

Keine fachliche Freigabe aus der Katalogerstellung ableiten.

- static: aktueller erfolgreicher Nachweis fehlt
- pester: aktueller erfolgreicher Nachweis fehlt
- windows: aktueller erfolgreicher Nachweis fehlt
- tenant: aktueller erfolgreicher Nachweis fehlt

## Voraussetzungen

- Module: Microsoft.Graph.Authentication, Microsoft.Graph (passende SDK-Untermodule)
- Dokumentierte Graph-Scopes: DeviceManagementConfiguration.Read.All, DeviceManagementManagedDevices.Read.All
- Hilfsdateien: Keine lokale Hilfsdatei erkannt.

## Verwendung

Noch kein geprüftes Aufrufbeispiel dokumentiert. Parameter mit `Get-Help './03_Compliance_Configuration/28_Get-DeviceConfigStatus.ps1' -Full` lesen.

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/03_Compliance_Configuration/28_Get-DeviceConfigStatus.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
