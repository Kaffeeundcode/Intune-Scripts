# Get-IntuneEndpointSecurityPolicyAudit

**Prüfstatus: Ungeprüft**

Analysiert Endpoint-Security-Richtlinien in Intune.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Listet Geraetekonfigurationen und ConfigurationPolicies, deren Typ oder
    Vorlagenreferenz auf Endpoint Security hindeutet, mit Zuweisungsanzahl.

## Prüfung

Keine fachliche Freigabe aus der Katalogerstellung ableiten.

- static: aktueller erfolgreicher Nachweis fehlt
- pester: aktueller erfolgreicher Nachweis fehlt
- windows: aktueller erfolgreicher Nachweis fehlt
- tenant: aktueller erfolgreicher Nachweis fehlt

## Voraussetzungen

- Module: Microsoft.Graph.Authentication
- Dokumentierte Graph-Scopes: DeviceManagementConfiguration.Read.All, DeviceManagementManagedDevices.Read.All
- Hilfsdateien: Keine lokale Hilfsdatei erkannt.

## Verwendung

```powershell
./21_Security_Deep_Dive/385_Get-IntuneEndpointSecurityPolicyAudit.ps1 -OutputPath './reports/endpoint-security-policies.csv'
```

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/21_Security_Deep_Dive/385_Get-IntuneEndpointSecurityPolicyAudit.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
