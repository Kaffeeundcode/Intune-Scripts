# Get-EntraIDShadowITApps

**Prüfstatus: Ungeprüft**

Identifies "Shadow IT" applications where users have consented to high-privilege scopes.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Scans all Service Principals (Enterprise Apps) in Entra ID.
    Looks for OAuth2PermissionGrants containing sensitive scopes like:
    - Directory.ReadWrite.All
    - User.ReadWrite.All
    - Mail.ReadWrite
    - Files.ReadWrite

    This helps identify risky 3rd party apps users may have connected.

## Prüfung

Keine fachliche Freigabe aus der Katalogerstellung ableiten.

- static: aktueller erfolgreicher Nachweis fehlt
- pester: aktueller erfolgreicher Nachweis fehlt
- windows: aktueller erfolgreicher Nachweis fehlt
- tenant: aktueller erfolgreicher Nachweis fehlt

## Voraussetzungen

- Module: Microsoft.Graph.Authentication, Microsoft.Graph (passende SDK-Untermodule)
- Dokumentierte Graph-Scopes: DelegatedPermissionGrant.Read.All, Application.Read.All
- Hilfsdateien: Keine lokale Hilfsdatei erkannt.

## Verwendung

Noch kein geprüftes Aufrufbeispiel dokumentiert. Parameter mit `Get-Help './16_Mixed_New_Scripts/111_Get-EntraIDShadowITApps.ps1' -Full` lesen.

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/16_Mixed_New_Scripts/111_Get-EntraIDShadowITApps.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
