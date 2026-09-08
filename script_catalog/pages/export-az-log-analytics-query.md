# Export-AzLogAnalyticsQuery

**Prüfstatus: Ungeprüft**

Führt eine KQL Query gegen Log Analytics aus und exportiert das Ergebnis als CSV.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Automatisiert Reportings aus Logs (z.B. Security Events, Performance).

    Parameter:
    - WorkspaceId: ID des Workspaces
    - Query: KQL Abfrage
    - OutputFile: Ziel-CSV

## Prüfung

Keine fachliche Freigabe aus der Katalogerstellung ableiten.

- static: aktueller erfolgreicher Nachweis fehlt
- pester: aktueller erfolgreicher Nachweis fehlt
- windows: aktueller erfolgreicher Nachweis fehlt
- tenant: aktueller erfolgreicher Nachweis fehlt

## Voraussetzungen

- Module: Skript prüfen; keine Cloud-Module erkannt.
- Dokumentierte Graph-Scopes: Nicht angegeben; vor Tenant-Nutzung prüfen.
- Hilfsdateien: Keine lokale Hilfsdatei erkannt.

## Verwendung

Noch kein geprüftes Aufrufbeispiel dokumentiert. Parameter mit `Get-Help './05_Azure_Automation/095_Export-AzLogAnalyticsQuery.ps1' -Full` lesen.

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/05_Azure_Automation/095_Export-AzLogAnalyticsQuery.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
