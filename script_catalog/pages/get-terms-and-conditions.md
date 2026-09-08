# Get-TermsAndConditions

**Prüfstatus: Ungeprüft**

Listet Nutzungsbedingungen (Terms and Conditions) auf.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Zeigt alle T&C Policies im Tenant an.
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

Noch kein geprüftes Aufrufbeispiel dokumentiert. Parameter mit `Get-Help './15_Intune_Advanced_Enrollment/149_Get-TermsAndConditions.ps1' -Full` lesen.

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/15_Intune_Advanced_Enrollment/149_Get-TermsAndConditions.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
