# Reset-DevicePasscode

**Prüfstatus: Ungeprüft**

Entfernt/Setzt den Passcode zurück (iOS/Android).

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Löscht den Geräte-Passcode (nicht User-Passwort!), damit User wieder Zugriff haben.
    Erfordert die Berechtigung 'DeviceManagementManagedDevices.ReadWrite.All'.

## Prüfung

Keine fachliche Freigabe aus der Katalogerstellung ableiten.

- static: aktueller erfolgreicher Nachweis fehlt
- pester: aktueller erfolgreicher Nachweis fehlt
- windows: aktueller erfolgreicher Nachweis fehlt
- tenant: aktueller erfolgreicher Nachweis fehlt

## Voraussetzungen

- Module: Microsoft.Graph.Authentication, Microsoft.Graph (passende SDK-Untermodule)
- Dokumentierte Graph-Scopes: DeviceManagementManagedDevices.ReadWrite.All
- Hilfsdateien: Keine lokale Hilfsdatei erkannt.

## Verwendung

Noch kein geprüftes Aufrufbeispiel dokumentiert. Parameter mit `Get-Help './08_Troubleshooting_Cleanup/74_Reset-DevicePasscode.ps1' -Full` lesen.

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/08_Troubleshooting_Cleanup/74_Reset-DevicePasscode.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
