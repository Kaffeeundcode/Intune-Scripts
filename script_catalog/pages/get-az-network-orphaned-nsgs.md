# Get-AzNetworkOrphanedNSGs

**Prüfstatus: Ungeprüft**

Identifies Network Security Groups (NSGs) that are not associated with any Subnet or Network Interface.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Orphaned NSGs clutter the environment and provide no value.
    This script checks the 'Subnets' and 'NetworkInterfaces' properties of every NSG.

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

Noch kein geprüftes Aufrufbeispiel dokumentiert. Parameter mit `Get-Help './16_Mixed_New_Scripts/123_Get-AzNetworkOrphanedNSGs.ps1' -Full` lesen.

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/16_Mixed_New_Scripts/123_Get-AzNetworkOrphanedNSGs.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
