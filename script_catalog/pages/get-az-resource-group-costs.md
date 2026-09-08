# Get-AzResourceGroupCosts

**Prüfstatus: Ungeprüft**

Ruft die angefallenen Kosten für eine bestimmte Azure Resource Group ab.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Dieses Skript analysiert die Kosten einer Resource Group für einen bestimmten Zeitraum (Standard: letzte 30 Tage).
    Es verwendet das 'Az'-Modul (Az.CostManagement).

    Parameter:
    - ResourceGroupName: Name der Ressourcengruppe
    - DaysBack: Zeitraum in Tagen (Standard: 30)

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

Noch kein geprüftes Aufrufbeispiel dokumentiert. Parameter mit `Get-Help './01_Azure_Infrastructure/001_Get-AzResourceGroupCosts.ps1' -Full` lesen.

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/01_Azure_Infrastructure/001_Get-AzResourceGroupCosts.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
