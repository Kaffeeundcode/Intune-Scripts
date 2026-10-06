# Get-IntuneAppAdoptionMetrics

**Prüfstatus: Ungeprüft**

Misst App-Zuweisung und Verteilung.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Listet Apps mit Zuweisungsanzahl und bewertet die Verteilung.

## Prüfung

Keine fachliche Freigabe aus der Katalogerstellung ableiten.

- static: aktueller erfolgreicher Nachweis fehlt
- pester: aktueller erfolgreicher Nachweis fehlt
- windows: aktueller erfolgreicher Nachweis fehlt
- tenant: aktueller erfolgreicher Nachweis fehlt

## Voraussetzungen

- Module: Microsoft.Graph.Authentication
- Dokumentierte Graph-Scopes: DeviceManagementApps.Read.All
- Hilfsdateien: Keine lokale Hilfsdatei erkannt.

## Verwendung

```powershell
./30_Intune_Adoption_Metrics/421_Get-IntuneAppAdoptionMetrics.ps1 -OutputPath './reports/app-adoption.csv'
```

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/30_Intune_Adoption_Metrics/421_Get-IntuneAppAdoptionMetrics.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
