# Get-AzLogAnalyticsRetention

**Prüfstatus: Ungeprüft**

Prüft die Aufbewahrungsdauer (Retention) von Log Analytics Workspaces.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Eine zu lange Retention kann hohe Kosten verursachen.
    Dieses Skript listet alle Workspaces und deren Retention in Tagen auf.

## Prüfung

Keine fachliche Freigabe aus der Katalogerstellung ableiten.

- static: aktueller erfolgreicher Nachweis fehlt
- pester: aktueller erfolgreicher Nachweis fehlt
- windows: aktueller erfolgreicher Nachweis fehlt
- tenant: aktueller erfolgreicher Nachweis fehlt

## Voraussetzungen

- Module: Az
- Dokumentierte Graph-Scopes: Nicht angegeben; vor Tenant-Nutzung prüfen.
- Hilfsdateien: Keine lokale Hilfsdatei erkannt.

## Verwendung

Noch kein geprüftes Aufrufbeispiel dokumentiert. Parameter mit `Get-Help './05_Azure_Automation/081_Get-AzLogAnalyticsRetention.ps1' -Full` lesen.

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/05_Azure_Automation/081_Get-AzLogAnalyticsRetention.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
