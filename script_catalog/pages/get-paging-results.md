# Get-PagingResults

**Prüfstatus: Ungeprüft**

Beispiel für Paging (Blättern) durch Ergebnisse.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Zeigt, wie man mehr als 1000 Ergebnisse durchläuft (NextLink).
    Die Cmdlets machen das oft automatisch (-All), hier manuell.

## Prüfung

Keine fachliche Freigabe aus der Katalogerstellung ableiten.

- static: aktueller erfolgreicher Nachweis fehlt
- pester: aktueller erfolgreicher Nachweis fehlt
- windows: aktueller erfolgreicher Nachweis fehlt
- tenant: aktueller erfolgreicher Nachweis fehlt

## Voraussetzungen

- Module: Microsoft.Graph.Authentication
- Dokumentierte Graph-Scopes: Nicht angegeben; vor Tenant-Nutzung prüfen.
- Hilfsdateien: Keine lokale Hilfsdatei erkannt.

## Verwendung

Noch kein geprüftes Aufrufbeispiel dokumentiert. Parameter mit `Get-Help './09_Graph_API_Advanced/87_Get-PagingResults.ps1' -Full` lesen.

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/09_Graph_API_Advanced/87_Get-PagingResults.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
