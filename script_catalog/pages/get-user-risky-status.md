# Get-UserRiskyStatus

**Prüfstatus: Ungeprüft**

Prüft, ob Benutzer als "Risky Users" markiert sind (Identity Protection).

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Zeigt Benutzer mit hohem oder mittlerem Risiko-Level.
    Erfordert die Berechtigung 'IdentityRiskEvent.Read.All'.

## Prüfung

Keine fachliche Freigabe aus der Katalogerstellung ableiten.

- static: aktueller erfolgreicher Nachweis fehlt
- pester: aktueller erfolgreicher Nachweis fehlt
- windows: aktueller erfolgreicher Nachweis fehlt
- tenant: aktueller erfolgreicher Nachweis fehlt

## Voraussetzungen

- Module: Microsoft.Graph.Authentication, Microsoft.Graph (passende SDK-Untermodule)
- Dokumentierte Graph-Scopes: IdentityRiskEvent.Read.All
- Hilfsdateien: Keine lokale Hilfsdatei erkannt.

## Verwendung

Noch kein geprüftes Aufrufbeispiel dokumentiert. Parameter mit `Get-Help './11_EntraID_UserManagement/104_Get-UserRiskyStatus.ps1' -Full` lesen.

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/11_EntraID_UserManagement/104_Get-UserRiskyStatus.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
