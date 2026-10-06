# Get-IntunePolicyAdoptionMetrics

**Prüfstatus: Ungeprüft**

Misst Adoptionsgrad von Richtlinien.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Berechnet Zuweisungs- und Filterabdeckung von Konfigurationsrichtlinien.

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
./30_Intune_Adoption_Metrics/420_Get-IntunePolicyAdoptionMetrics.ps1 -OutputPath './reports/policy-adoption.csv'
```

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/30_Intune_Adoption_Metrics/420_Get-IntunePolicyAdoptionMetrics.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
