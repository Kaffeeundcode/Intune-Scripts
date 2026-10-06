# Get-IntuneComplianceStatusMatrixReport

**Prüfstatus: Ungeprüft**

Erstellt eine Compliance-Statusmatrix.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Vergleicht Compliance-State, Management-State und Sync-Status je Geraet. Das Skript
    bewertet nicht die Ursache.

## Prüfung

Keine fachliche Freigabe aus der Katalogerstellung ableiten.

- static: aktueller erfolgreicher Nachweis fehlt
- pester: aktueller erfolgreicher Nachweis fehlt
- windows: aktueller erfolgreicher Nachweis fehlt
- tenant: aktueller erfolgreicher Nachweis fehlt

## Voraussetzungen

- Module: Microsoft.Graph.Authentication
- Dokumentierte Graph-Scopes: DeviceManagementManagedDevices.Read.All
- Hilfsdateien: Keine lokale Hilfsdatei erkannt.

## Verwendung

```powershell
./32_Intune_Configuration_Matrix/428_Get-IntuneComplianceStatusMatrixReport.ps1 -OutputPath './reports/compliance-status-matrix.csv'
```

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/32_Intune_Configuration_Matrix/428_Get-IntuneComplianceStatusMatrixReport.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
