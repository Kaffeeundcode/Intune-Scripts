# Get-AzSubscriptionQuotas

**Prüfstatus: Ungeprüft**

Prüft die Nutzungsquoten (vCPUs) in einer Region und warnt bei hohem Verbrauch.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Azure Subscriptions haben Limits für vCPUs pro Region.
    Dieses Skript listet die aktuelle Auslastung auf, um Engpässe vor Deployments zu erkennen.

    Parameter:
    - Region: Azure Region (z.B. 'westeurope')

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

Noch kein geprüftes Aufrufbeispiel dokumentiert. Parameter mit `Get-Help './01_Azure_Infrastructure/011_Get-AzSubscriptionQuotas.ps1' -Full` lesen.

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/01_Azure_Infrastructure/011_Get-AzSubscriptionQuotas.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
