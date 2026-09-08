# Get-IntunePolicyPerSettingStatus

**Prüfstatus: Ungeprüft**

Exports detailed status for every setting within a specific Intune Configuration Profile.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    This script prompts for a Configuration Profile ID (or name search) and then retrieves
    the per-setting status for devices assigned to it.
    It helps troubleshoot which specific setting is failing in a large policy (e.g. Security Baseline).

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

Noch kein geprüftes Aufrufbeispiel dokumentiert. Parameter mit `Get-Help './16_Mixed_New_Scripts/102_Get-IntunePolicyPerSettingStatus.ps1' -Full` lesen.

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/16_Mixed_New_Scripts/102_Get-IntunePolicyPerSettingStatus.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
