# Get-IntunePolicyCoverageMatrixReport

**Prüfstatus: Ungeprüft**

Erstellt eine Policy-Abdeckungsmatrix.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Bewertet Richtlinien nach Zuweisung und Filternutzung. Ziel ist eine schnelle Abdeckungsmatrix.

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
./32_Intune_Configuration_Matrix/430_Get-IntunePolicyCoverageMatrixReport.ps1 -OutputPath './reports/policy-coverage-matrix.csv'
```

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/32_Intune_Configuration_Matrix/430_Get-IntunePolicyCoverageMatrixReport.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
