# Get-IntuneUpdateAdoptionMetrics

**Prüfstatus: Ungeprüft**

Misst die Adaption von Update-Richtlinien.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Listet Update-Richtlinien und deren Zuweisungen. Das Skript bewertet keine Geraete-Updates.

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
./30_Intune_Adoption_Metrics/422_Get-IntuneUpdateAdoptionMetrics.ps1 -OutputPath './reports/update-adoption.csv'
```

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/30_Intune_Adoption_Metrics/422_Get-IntuneUpdateAdoptionMetrics.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
