# Get-IntuneNetworkProfileInventory

**Prüfstatus: Ungeprüft**

Listet netzwerkbezogene Intune-Richtlinien.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Filtert Konfigurationsobjekte nach Wi-Fi-, VPN-, Proxy- oder Netzwerkbezug und listet
    Name, Typ und Zuweisungsanzahl.

## Prüfung

Keine fachliche Freigabe aus der Katalogerstellung ableiten.

- static: aktueller erfolgreicher Nachweis fehlt
- pester: aktueller erfolgreicher Nachweis fehlt
- windows: aktueller erfolgreicher Nachweis fehlt
- tenant: aktueller erfolgreicher Nachweis fehlt

## Voraussetzungen

- Module: Microsoft.Graph.Authentication
- Dokumentierte Graph-Scopes: DeviceManagementConfiguration.Read.All
- Hilfsdateien: Keine lokale Hilfsdatei erkannt.

## Verwendung

```powershell
./24_Network_Readiness/395_Get-IntuneNetworkProfileInventory.ps1 -OutputPath './reports/network-profiles.csv'
```

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/24_Network_Readiness/395_Get-IntuneNetworkProfileInventory.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
