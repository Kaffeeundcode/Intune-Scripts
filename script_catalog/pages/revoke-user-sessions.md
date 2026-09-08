# Revoke-UserSessions

**Prüfstatus: Ungeprüft**

Widerruft alle Sitzungen eines Benutzers (Revoke Sessions).

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Zwingt den Benutzer zur erneuten Anmeldung auf allen Geräten/Apps.
    Erfordert die Berechtigung 'User.ReadWrite.All'.

## Prüfung

Keine fachliche Freigabe aus der Katalogerstellung ableiten.

- static: aktueller erfolgreicher Nachweis fehlt
- pester: aktueller erfolgreicher Nachweis fehlt
- windows: aktueller erfolgreicher Nachweis fehlt
- tenant: aktueller erfolgreicher Nachweis fehlt

## Voraussetzungen

- Module: Microsoft.Graph.Authentication
- Dokumentierte Graph-Scopes: User.ReadWrite.All
- Hilfsdateien: Keine lokale Hilfsdatei erkannt.

## Verwendung

Noch kein geprüftes Aufrufbeispiel dokumentiert. Parameter mit `Get-Help './11_EntraID_UserManagement/105_Revoke-UserSessions.ps1' -Full` lesen.

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/11_EntraID_UserManagement/105_Revoke-UserSessions.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
