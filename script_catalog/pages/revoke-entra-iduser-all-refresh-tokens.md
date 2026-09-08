# Revoke-EntraIDUserAllRefreshTokens

**Prüfstatus: Ungeprüft**

Widerruft alle Refresh Tokens eines Benutzers (Zwangsabmeldung).

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Nützlich bei Verdacht auf Kompromittierung oder bei Verlust eines Geräts.
    Zwingt den Benutzer zur erneuten Anmeldung auf allen Geräten/Apps.

    Parameter:
    - UserPrincipalName: Der betroffene Benutzer.

## Prüfung

Keine fachliche Freigabe aus der Katalogerstellung ableiten.

- static: aktueller erfolgreicher Nachweis fehlt
- pester: aktueller erfolgreicher Nachweis fehlt
- windows: aktueller erfolgreicher Nachweis fehlt
- tenant: aktueller erfolgreicher Nachweis fehlt

## Voraussetzungen

- Module: Microsoft.Graph.Authentication, Microsoft.Graph (passende SDK-Untermodule)
- Dokumentierte Graph-Scopes: Nicht angegeben; vor Tenant-Nutzung prüfen.
- Hilfsdateien: Keine lokale Hilfsdatei erkannt.

## Verwendung

Noch kein geprüftes Aufrufbeispiel dokumentiert. Parameter mit `Get-Help './02_EntraID_Governance/031_Revoke-EntraIDUserAllRefreshTokens.ps1' -Full` lesen.

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/02_EntraID_Governance/031_Revoke-EntraIDUserAllRefreshTokens.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
