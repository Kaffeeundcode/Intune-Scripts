# Get-VppTokens

**Prüfstatus: Ungeprüft**

Listet VPP Tokens (Apple Volume Purchase Program) auf.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Zeigt Status und Ablaufdatum von VPP Token.
    Erfordert die Berechtigung 'DeviceManagementApps.Read.All'.

## Prüfung

Keine fachliche Freigabe aus der Katalogerstellung ableiten.

- static: aktueller erfolgreicher Nachweis fehlt
- pester: aktueller erfolgreicher Nachweis fehlt
- windows: aktueller erfolgreicher Nachweis fehlt
- tenant: aktueller erfolgreicher Nachweis fehlt

## Voraussetzungen

- Module: Microsoft.Graph.Authentication, Microsoft.Graph (passende SDK-Untermodule)
- Dokumentierte Graph-Scopes: DeviceManagementApps.Read.All
- Hilfsdateien: Keine lokale Hilfsdatei erkannt.

## Verwendung

Noch kein geprüftes Aufrufbeispiel dokumentiert. Parameter mit `Get-Help './15_Intune_Advanced_Enrollment/146_Get-VppTokens.ps1' -Full` lesen.

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/15_Intune_Advanced_Enrollment/146_Get-VppTokens.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
