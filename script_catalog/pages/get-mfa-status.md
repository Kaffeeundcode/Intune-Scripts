# Get-MfaStatus

**Prüfstatus: Ungeprüft**

Prüft MFA Registrierungen (Authentication Methods).

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Zeigt, welche Auth-Methoden ein User registriert hat (App, Phone etc.).
    Erfordert die Berechtigung 'UserAuthenticationMethod.Read.All'.

## Prüfung

Keine fachliche Freigabe aus der Katalogerstellung ableiten.

- static: aktueller erfolgreicher Nachweis fehlt
- pester: aktueller erfolgreicher Nachweis fehlt
- windows: aktueller erfolgreicher Nachweis fehlt
- tenant: aktueller erfolgreicher Nachweis fehlt

## Voraussetzungen

- Module: Microsoft.Graph.Authentication, Microsoft.Graph (passende SDK-Untermodule)
- Dokumentierte Graph-Scopes: UserAuthenticationMethod.Read.All
- Hilfsdateien: Keine lokale Hilfsdatei erkannt.

## Verwendung

Noch kein geprüftes Aufrufbeispiel dokumentiert. Parameter mit `Get-Help './14_EntraID_Security_CA/135_Get-MfaStatus.ps1' -Full` lesen.

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/14_EntraID_Security_CA/135_Get-MfaStatus.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
