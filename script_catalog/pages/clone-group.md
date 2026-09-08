# Clone-Group

**Prüfstatus: Ungeprüft**

Klont eine statische Gruppe (nur Struktur, keine Mitglieder).

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Erstellt eine neue leere Gruppe mit demselben Namen (+ Copy) und Beschreibung.
    Erfordert die Berechtigung 'Group.ReadWrite.All'.

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

Noch kein geprüftes Aufrufbeispiel dokumentiert. Parameter mit `Get-Help './12_EntraID_GroupManagement/113_Clone-Group.ps1' -Full` lesen.

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/12_EntraID_GroupManagement/113_Clone-Group.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
