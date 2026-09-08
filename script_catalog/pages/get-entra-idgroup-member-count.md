# Get-EntraIDGroupMemberCount

**Prüfstatus: Ungeprüft**

Zählt die Mitglieder aller Gruppen und warnt bei sehr großen Gruppen.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Hilft, "Monster-Gruppen" zu finden, die ggf. Governance-Probleme verursachen.

    Parameter:
    - Limit: Warnschwelle (Default: 500)

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

Noch kein geprüftes Aufrufbeispiel dokumentiert. Parameter mit `Get-Help './02_EntraID_Governance/034_Get-EntraIDGroupMemberCount.ps1' -Full` lesen.

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/02_EntraID_Governance/034_Get-EntraIDGroupMemberCount.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
