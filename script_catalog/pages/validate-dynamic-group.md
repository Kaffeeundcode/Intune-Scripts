# Validate-DynamicGroup

**Prüfstatus: Ungeprüft**

Pausiert/Startet die Verarbeitung einer dynamischen Gruppe.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Kann genutzt werden, um das ProcessingState neu zu triggern (wenn unterstützt).
    Hinweis: Direktes 'Validate' ist nur via UI einfach, hier prüfen wir den Status.
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

Noch kein geprüftes Aufrufbeispiel dokumentiert. Parameter mit `Get-Help './12_EntraID_GroupManagement/112_Validate-DynamicGroup.ps1' -Full` lesen.

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/12_EntraID_GroupManagement/112_Validate-DynamicGroup.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
