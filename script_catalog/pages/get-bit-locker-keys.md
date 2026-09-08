# Get-BitLockerKeys

**Prüfstatus: Ungeprüft**

Ruft den BitLocker Recovery Key für ein Gerät ab.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Liest den 48-stelligen Wiederherstellungsschlüssel aus Azure AD / Intune.
    Erfordert die Berechtigung 'BitlockerKey.Read.All'.

## Prüfung

Keine fachliche Freigabe aus der Katalogerstellung ableiten.

- static: aktueller erfolgreicher Nachweis fehlt
- pester: aktueller erfolgreicher Nachweis fehlt
- windows: aktueller erfolgreicher Nachweis fehlt
- tenant: aktueller erfolgreicher Nachweis fehlt

## Voraussetzungen

- Module: Microsoft.Graph.Authentication, Microsoft.Graph (passende SDK-Untermodule)
- Dokumentierte Graph-Scopes: BitlockerKey.Read.All, DeviceManagementManagedDevices.Read.All
- Hilfsdateien: Keine lokale Hilfsdatei erkannt.

## Verwendung

Noch kein geprüftes Aufrufbeispiel dokumentiert. Parameter mit `Get-Help './07_Security_BitLocker/61_Get-BitLockerKeys.ps1' -Full` lesen.

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/07_Security_BitLocker/61_Get-BitLockerKeys.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
