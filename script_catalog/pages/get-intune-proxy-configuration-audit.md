# Get-IntuneProxyConfigurationAudit

**Prüfstatus: Ungeprüft**

Prueft Proxy-Konfigurationen in Intune.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Filtert Proxy-Richtlinien und listet deren Zuweisung und Konfigurationsstatus. Das
    Skript testet keine Netzwerkverbindung.

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
./24_Network_Readiness/398_Get-IntuneProxyConfigurationAudit.ps1 -OutputPath './reports/proxy-audit.csv'
```

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/24_Network_Readiness/398_Get-IntuneProxyConfigurationAudit.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
