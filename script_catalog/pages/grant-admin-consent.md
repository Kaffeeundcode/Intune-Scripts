# Grant-AdminConsent

**Prüfstatus: Ungeprüft**

Erteilt Admin Consent für Permissions.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Genehmigt angeforderte Berechtigungen für eine App/Service Principal.
    Erfordert die Berechtigung 'AppRoleAssignment.ReadWrite.All' oder Global Admin.

## Prüfung

Keine fachliche Freigabe aus der Katalogerstellung ableiten.

- static: aktueller erfolgreicher Nachweis fehlt
- pester: aktueller erfolgreicher Nachweis fehlt
- windows: aktueller erfolgreicher Nachweis fehlt
- tenant: aktueller erfolgreicher Nachweis fehlt

## Voraussetzungen

- Module: Microsoft.Graph (passende SDK-Untermodule)
- Dokumentierte Graph-Scopes: AppRoleAssignment.ReadWrite.All
- Hilfsdateien: Keine lokale Hilfsdatei erkannt.

## Verwendung

Noch kein geprüftes Aufrufbeispiel dokumentiert. Parameter mit `Get-Help './13_EntraID_AppRegistration/125_Grant-AdminConsent.ps1' -Full` lesen.

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/13_EntraID_AppRegistration/125_Grant-AdminConsent.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
