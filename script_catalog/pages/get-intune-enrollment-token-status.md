# Get-IntuneEnrollmentTokenStatus

**Prüfstatus: Ungeprüft**

Checks the status and expiration of Enrollment Tokens (DEM, Apple VPP, DEP, Android).

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Consolidated report for all "expiring" infrastructure tokens in Intune.
    - Device Enrollment Managers (Limit 1000)
    - Apple Push Certificate (APNS)
    - Apple VPP Tokens
    - Android Managed Google Play

    Returns "DaysRemaining" to allow for alerting.

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

Noch kein geprüftes Aufrufbeispiel dokumentiert. Parameter mit `Get-Help './16_Mixed_New_Scripts/108_Get-IntuneEnrollmentTokenStatus.ps1' -Full` lesen.

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/16_Mixed_New_Scripts/108_Get-IntuneEnrollmentTokenStatus.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
