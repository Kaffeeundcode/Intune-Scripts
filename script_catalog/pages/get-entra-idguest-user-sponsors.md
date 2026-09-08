# Get-EntraIDGuestUserSponsors

**Prüfstatus: Ungeprüft**

Identifies the "Sponsor" or inviter of Guest Users in Entra ID.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Often, Guest users are created but nobody knows who invited them.
    This script attempts to look up the 'manager' or creation logs to find the sponsor.

    Note: 'Sponsor' is not a default attribute for old guests, but modern logic often
    uses the 'Manager' field or 'CreatedBy' audit log (if recent).

## Prüfung

Keine fachliche Freigabe aus der Katalogerstellung ableiten.

- static: aktueller erfolgreicher Nachweis fehlt
- pester: aktueller erfolgreicher Nachweis fehlt
- windows: aktueller erfolgreicher Nachweis fehlt
- tenant: aktueller erfolgreicher Nachweis fehlt

## Voraussetzungen

- Module: Microsoft.Graph.Authentication, Microsoft.Graph (passende SDK-Untermodule)
- Dokumentierte Graph-Scopes: User.Read.All, Directory.Read.All, AuditLog.Read.All
- Hilfsdateien: Keine lokale Hilfsdatei erkannt.

## Verwendung

Noch kein geprüftes Aufrufbeispiel dokumentiert. Parameter mit `Get-Help './16_Mixed_New_Scripts/112_Get-EntraIDGuestUserSponsors.ps1' -Full` lesen.

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/16_Mixed_New_Scripts/112_Get-EntraIDGuestUserSponsors.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
