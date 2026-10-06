# Get-IntunePolicyAssignmentAudit

**Prüfstatus: Ungeprüft**

Analysiert Zielgruppen und Zuweisungsart von Intune-Richtlinien.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Listet Geraete-, Compliance-, Group-Policy- und Settings-Catalog-Richtlinien mit
    Zuweisungsanzahl, Zielgruppen und Filter-Verwendung.

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
./20_Policy_Hygiene/380_Get-IntunePolicyAssignmentAudit.ps1 -OutputPath './reports/policy-assignment-audit.csv'
```

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/20_Policy_Hygiene/380_Get-IntunePolicyAssignmentAudit.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
