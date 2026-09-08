# Set-EntraIDUserLocationFromIP

**Prüfstatus: Ungeprüft**

Suggests Usage Location updates for users based on their recent successful sign-in IP.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Users in Entra ID need a UsageLocation to be assigned licenses.
    This script looks at the last successful interactive sign-in, determines the country from
    the IP address (via Graph Sign-in logs), and suggests setting the UsageLocation.

    Use -Confirm to apply.

## Prüfung

Keine fachliche Freigabe aus der Katalogerstellung ableiten.

- static: aktueller erfolgreicher Nachweis fehlt
- pester: aktueller erfolgreicher Nachweis fehlt
- windows: aktueller erfolgreicher Nachweis fehlt
- tenant: aktueller erfolgreicher Nachweis fehlt

## Voraussetzungen

- Module: Microsoft.Graph.Authentication, Microsoft.Graph (passende SDK-Untermodule)
- Dokumentierte Graph-Scopes: AuditLog.Read.All, User.ReadWrite.All, Directory.Read.All
- Hilfsdateien: Keine lokale Hilfsdatei erkannt.

## Verwendung

Noch kein geprüftes Aufrufbeispiel dokumentiert. Parameter mit `Get-Help './16_Mixed_New_Scripts/118_Set-EntraIDUserLocationFromIP.ps1' -Full` lesen.

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/16_Mixed_New_Scripts/118_Set-EntraIDUserLocationFromIP.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
