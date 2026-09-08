# Get-EntraIDRoleEligibleAssignments

**Prüfstatus: Ungeprüft**

Zeigt an, welche Benutzer für Admin-Rollen "Berechtigt" (Eligible) sind (PIM).

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Wichtig für PIM-Validierung. Zeigt nicht die aktiven, sondern die möglichen Rollen.
    Benötigt PIM-Rechte.

    Parameter:
    - UserEmail: (Optional) Filter auf einen User.

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

Noch kein geprüftes Aufrufbeispiel dokumentiert. Parameter mit `Get-Help './02_EntraID_Governance/029_Get-EntraIDRoleEligibleAssignments.ps1' -Full` lesen.

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/02_EntraID_Governance/029_Get-EntraIDRoleEligibleAssignments.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
