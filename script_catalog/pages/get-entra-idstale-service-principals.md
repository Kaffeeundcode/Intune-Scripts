# Get-EntraIDStaleServicePrincipals

**Prüfstatus: Ungeprüft**

Identifies Service Principals (Enterprise Apps) that have not signed in recently.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Scanning 'SignInLogs' for ServicePrincipals is key to reducing attack surface.
    This script looks for SPs that haven't had a successful sign-in log in the last X days.

    Note: Requires P1/P2 for SignInLogs access.

## Prüfung

Keine fachliche Freigabe aus der Katalogerstellung ableiten.

- static: aktueller erfolgreicher Nachweis fehlt
- pester: aktueller erfolgreicher Nachweis fehlt
- windows: aktueller erfolgreicher Nachweis fehlt
- tenant: aktueller erfolgreicher Nachweis fehlt

## Voraussetzungen

- Module: Microsoft.Graph.Authentication, Microsoft.Graph (passende SDK-Untermodule)
- Dokumentierte Graph-Scopes: AuditLog.Read.All, Directory.Read.All
- Hilfsdateien: Keine lokale Hilfsdatei erkannt.

## Verwendung

Noch kein geprüftes Aufrufbeispiel dokumentiert. Parameter mit `Get-Help './16_Mixed_New_Scripts/115_Get-EntraIDStaleServicePrincipals.ps1' -Full` lesen.

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/16_Mixed_New_Scripts/115_Get-EntraIDStaleServicePrincipals.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
