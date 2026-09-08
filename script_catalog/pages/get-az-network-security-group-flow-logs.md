# Get-AzNetworkSecurityGroupFlowLogs

**Prüfstatus: Ungeprüft**

Prüft den Status der NSG Flow Logs für Network Security Groups.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Network Security Group (NSG) Flow Logs ermöglichen es, Traffic-Muster zu analysieren.
    Dieses Skript listet alle NSGs in einer Resource Group auf und zeigt, ob Flow Logs aktiviert sind.

    Voraussetzung: Network Watcher muss in der Region aktiv sein.

    Parameter:
    - ResourceGroupName: Name der Ressourcengruppe mit den NSGs
    - NetworkWatcherName: Name des Network Watchers
    - NetworkWatcherRG: RG des Network Watchers

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

Noch kein geprüftes Aufrufbeispiel dokumentiert. Parameter mit `Get-Help './01_Azure_Infrastructure/006_Get-AzNetworkSecurityGroupFlowLogs.ps1' -Full` lesen.

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/01_Azure_Infrastructure/006_Get-AzNetworkSecurityGroupFlowLogs.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
