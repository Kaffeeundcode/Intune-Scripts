# Get-AzVNetSubnetUsage

**Prüfstatus: Ungeprüft**

Zeigt die Belegung von Subnetzen in einem virtuellen Netzwerk an.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Hilft bei der Planung von neuen Deployments, um sicherzustellen, dass genügend IP-Adressen im Subnetz frei sind.

    Parameter:
    - ResourceGroupName: RG Name
    - VNetName: Name des VNet

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

Noch kein geprüftes Aufrufbeispiel dokumentiert. Parameter mit `Get-Help './01_Azure_Infrastructure/013_Get-AzVNetSubnetUsage.ps1' -Full` lesen.

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/01_Azure_Infrastructure/013_Get-AzVNetSubnetUsage.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
