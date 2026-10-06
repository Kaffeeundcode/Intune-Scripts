# Get-IntuneEmptyPolicyReport

**Prüfstatus: Ungeprüft**

Findet Intune-Richtlinien ohne Zuweisung.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Prueft Geraetekonfigurationen, Compliance-Richtlinien, Group-Policy-Objekte und
    Settings-Catalog-Richtlinien auf assignments. Nicht zugewiesene Policies werden
    als Auffaellig markiert.

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
./20_Policy_Hygiene/379_Get-IntuneEmptyPolicyReport.ps1 -OutputPath './reports/empty-policies.csv'
```

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/20_Policy_Hygiene/379_Get-IntuneEmptyPolicyReport.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
