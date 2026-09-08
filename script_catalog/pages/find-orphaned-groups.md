# Find-OrphanedGroups

**Prüfstatus: Ungeprüft**

Findet Gruppen ohne Besitzer (Orphaned Groups).

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Durchsucht alle Gruppen und prüft, ob die Owner-Liste leer ist.
    Erfordert die Berechtigung 'Group.Read.All'.

## Prüfung

Keine fachliche Freigabe aus der Katalogerstellung ableiten.

- static: aktueller erfolgreicher Nachweis fehlt
- pester: aktueller erfolgreicher Nachweis fehlt
- windows: aktueller erfolgreicher Nachweis fehlt
- tenant: aktueller erfolgreicher Nachweis fehlt

## Voraussetzungen

- Module: Microsoft.Graph.Authentication, Microsoft.Graph (passende SDK-Untermodule)
- Dokumentierte Graph-Scopes: Group.Read.All
- Hilfsdateien: Keine lokale Hilfsdatei erkannt.

## Verwendung

Noch kein geprüftes Aufrufbeispiel dokumentiert. Parameter mit `Get-Help './12_EntraID_GroupManagement/116_Find-OrphanedGroups.ps1' -Full` lesen.

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/12_EntraID_GroupManagement/116_Find-OrphanedGroups.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
