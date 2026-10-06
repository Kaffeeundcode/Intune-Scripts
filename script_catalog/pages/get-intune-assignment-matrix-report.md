# Get-IntuneAssignmentMatrixReport

**Prüfstatus: Ungeprüft**

Erstellt eine Richtlinien-Zuweisungsmatrix.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Listet Richtlinien und ihre Zielgruppen als Matrix. Das Skript dient der Uebersicht,
    nicht der Konformitaetsbewertung.

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
./32_Intune_Configuration_Matrix/427_Get-IntuneAssignmentMatrixReport.ps1 -OutputPath './reports/assignment-matrix.csv'
```

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/32_Intune_Configuration_Matrix/427_Get-IntuneAssignmentMatrixReport.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
