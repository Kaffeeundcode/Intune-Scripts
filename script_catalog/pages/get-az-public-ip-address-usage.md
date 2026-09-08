# Get-AzPublicIpAddressUsage

**Prüfstatus: Ungeprüft**

Listet alle Public IP Adressen auf und zeigt, wo sie verwendet werden.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Hilft, verwaiste öffentliche IPs zu finden oder einen Überblick über die externen Zugriffspunkte zu bekommen.
    Zeigt IP-Adresse, DNS-Name und zugeordnete Ressource (NIC, Load Balancer, VPN Gateway).

    Parameter:
    - ResourceGroupName: (Optional) Filter auf eine RG. Wenn leer, wird die ganze Subscription durchsucht.

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

Noch kein geprüftes Aufrufbeispiel dokumentiert. Parameter mit `Get-Help './01_Azure_Infrastructure/008_Get-AzPublicIpAddressUsage.ps1' -Full` lesen.

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/01_Azure_Infrastructure/008_Get-AzPublicIpAddressUsage.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
