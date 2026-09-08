# Remove-EntraIDExpiredGroupLifecycle

**Prüfstatus: Ungeprüft**

Simulates or enforces cleanup of M365 Groups based on custom criteria (pseudo-Lifecycle Policy).

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Finds Unified Groups (Teams/SharePoint) that have not been renewed or active.
    This is for tenants WITHOUT P1/P2 licenses for automatic Lifecycle Policies.

    Checks: RenewedDateTime (if available) or CreatedDateTime.
    Action: Soft Delete (Move to Deleted Items) if -Confirm is passed.

## Prüfung

Keine fachliche Freigabe aus der Katalogerstellung ableiten.

- static: aktueller erfolgreicher Nachweis fehlt
- pester: aktueller erfolgreicher Nachweis fehlt
- windows: aktueller erfolgreicher Nachweis fehlt
- tenant: aktueller erfolgreicher Nachweis fehlt

## Voraussetzungen

- Module: Microsoft.Graph.Authentication, Microsoft.Graph (passende SDK-Untermodule)
- Dokumentierte Graph-Scopes: Group.ReadWrite.All
- Hilfsdateien: Keine lokale Hilfsdatei erkannt.

## Verwendung

Noch kein geprüftes Aufrufbeispiel dokumentiert. Parameter mit `Get-Help './16_Mixed_New_Scripts/113_Remove-EntraIDExpiredGroupLifecycle.ps1' -Full` lesen.

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/16_Mixed_New_Scripts/113_Remove-EntraIDExpiredGroupLifecycle.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
