# Get-EnrollmentRestrictions

**Prüfstatus: Ungeprüft**

Listet Einschränkungen für die Geräteregistrierung auf (Enrollment Restrictions).

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Zeigt, welche Plattformen und Versionen blockiert oder erlaubt sind.
    Erfordert die Berechtigung 'DeviceManagementConfiguration.Read.All'.

## Prüfung

Keine fachliche Freigabe aus der Katalogerstellung ableiten.

- static: aktueller erfolgreicher Nachweis fehlt
- pester: aktueller erfolgreicher Nachweis fehlt
- windows: aktueller erfolgreicher Nachweis fehlt
- tenant: aktueller erfolgreicher Nachweis fehlt

## Voraussetzungen

- Module: Microsoft.Graph.Authentication, Microsoft.Graph (passende SDK-Untermodule)
- Dokumentierte Graph-Scopes: DeviceManagementConfiguration.Read.All
- Hilfsdateien: Keine lokale Hilfsdatei erkannt.

## Verwendung

Noch kein geprüftes Aufrufbeispiel dokumentiert. Parameter mit `Get-Help './05_Enrollment_Autopilot/48_Get-EnrollmentRestrictions.ps1' -Full` lesen.

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/05_Enrollment_Autopilot/48_Get-EnrollmentRestrictions.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
