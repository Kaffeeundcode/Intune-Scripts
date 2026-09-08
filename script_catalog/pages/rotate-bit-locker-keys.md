# Rotate-BitLockerKeys

**Prüfstatus: Ungeprüft**

Triggered eine Rotation des BitLocker-Schlüssels.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Fordert das Gerät auf, einen neuen Recovery Key zu generieren und hochzuladen.
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

Noch kein geprüftes Aufrufbeispiel dokumentiert. Parameter mit `Get-Help './07_Security_BitLocker/62_Rotate-BitLockerKeys.ps1' -Full` lesen.

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/07_Security_BitLocker/62_Rotate-BitLockerKeys.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
