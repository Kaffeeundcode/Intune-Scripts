# Get-EntraIDApplicationOwnerAudit

**Prüfstatus: Ungeprüft**

Audit Applications (App Registrations) to find those with no owners or disabled owners.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Orphaned apps are a security risk. This script iterates all App Registrations,
    retrieves their owners, and checks if the owner account is Enabled.

    Report flags:
    - No Owners
    - Disabled Owner

## Prüfung

Keine fachliche Freigabe aus der Katalogerstellung ableiten.

- static: aktueller erfolgreicher Nachweis fehlt
- pester: aktueller erfolgreicher Nachweis fehlt
- windows: aktueller erfolgreicher Nachweis fehlt
- tenant: aktueller erfolgreicher Nachweis fehlt

## Voraussetzungen

- Module: Microsoft.Graph.Authentication, Microsoft.Graph (passende SDK-Untermodule)
- Dokumentierte Graph-Scopes: Application.Read.All, User.Read.All
- Hilfsdateien: Keine lokale Hilfsdatei erkannt.

## Verwendung

Noch kein geprüftes Aufrufbeispiel dokumentiert. Parameter mit `Get-Help './16_Mixed_New_Scripts/120_Get-EntraIDApplicationOwnerAudit.ps1' -Full` lesen.

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/16_Mixed_New_Scripts/120_Get-EntraIDApplicationOwnerAudit.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
