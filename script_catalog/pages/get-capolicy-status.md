# Get-CAPolicyStatus

**Prüfstatus: Ungeprüft**

Zeigt Status (Enabled/Disabled/ReportOnly) von CA Policies.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Schnelle Übersicht über aktive vs. inaktive Regeln.
    Erfordert die Berechtigung 'Policy.Read.All'.

## Prüfung

Keine fachliche Freigabe aus der Katalogerstellung ableiten.

- static: aktueller erfolgreicher Nachweis fehlt
- pester: aktueller erfolgreicher Nachweis fehlt
- windows: aktueller erfolgreicher Nachweis fehlt
- tenant: aktueller erfolgreicher Nachweis fehlt

## Voraussetzungen

- Module: Microsoft.Graph.Authentication, Microsoft.Graph (passende SDK-Untermodule)
- Dokumentierte Graph-Scopes: Policy.Read.All
- Hilfsdateien: Keine lokale Hilfsdatei erkannt.

## Verwendung

Noch kein geprüftes Aufrufbeispiel dokumentiert. Parameter mit `Get-Help './14_EntraID_Security_CA/133_Get-CAPolicyStatus.ps1' -Full` lesen.

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/14_EntraID_Security_CA/133_Get-CAPolicyStatus.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
