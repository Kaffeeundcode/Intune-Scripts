# Get-AzLoadBalancerHealth

**Prüfstatus: Ungeprüft**

Prüft den Health Probe Status eines Azure Load Balancers.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Zeigt an, wie viele Instanzen im Backend Pool "Healthy" oder "Unhealthy" sind.
    Nutzt 'Get-AzLoadBalancerProbeConfig' und Backend Health Metrics.

    Parameter:
    - ResourceGroupName: RG Name
    - LoadBalancerName: Name des LBs

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

Noch kein geprüftes Aufrufbeispiel dokumentiert. Parameter mit `Get-Help './01_Azure_Infrastructure/017_Get-AzLoadBalancerHealth.ps1' -Full` lesen.

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/01_Azure_Infrastructure/017_Get-AzLoadBalancerHealth.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
