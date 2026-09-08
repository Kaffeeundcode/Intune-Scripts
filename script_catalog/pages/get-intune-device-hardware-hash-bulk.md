# Get-IntuneDeviceHardwareHashBulk

**Prüfstatus: Ungeprüft**

Retrieves Hardware Hashes for Windows Autopilot from existing Intune devices.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    IMPORTANT: You cannot retrieve the full hardware hash from the Graph API for *existing* Intune devices
    if they were not already registered with Autopilot.
    However, if they ARE in Autopilot, this script exports them.

    For non-Autopilot devices, this script collects SerialNumbers and details to help
    target the 'Get-WindowsAutoPilotInfo' remediation script.

## Prüfung

Keine fachliche Freigabe aus der Katalogerstellung ableiten.

- static: aktueller erfolgreicher Nachweis fehlt
- pester: aktueller erfolgreicher Nachweis fehlt
- windows: aktueller erfolgreicher Nachweis fehlt
- tenant: aktueller erfolgreicher Nachweis fehlt

## Voraussetzungen

- Module: Microsoft.Graph.Authentication, Microsoft.Graph (passende SDK-Untermodule)
- Dokumentierte Graph-Scopes: DeviceManagementServiceConfig.Read.All, DeviceManagementManagedDevices.Read.All
- Hilfsdateien: Keine lokale Hilfsdatei erkannt.

## Verwendung

Noch kein geprüftes Aufrufbeispiel dokumentiert. Parameter mit `Get-Help './16_Mixed_New_Scripts/103_Get-IntuneDeviceHardwareHashBulk.ps1' -Full` lesen.

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/16_Mixed_New_Scripts/103_Get-IntuneDeviceHardwareHashBulk.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
