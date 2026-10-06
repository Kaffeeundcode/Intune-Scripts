# Get-IntunePolicyFieldCompletenessAudit

**Prüfstatus: Ungeprüft**

Prueft Pflichtfelder in Konfigurationsrichtlinien.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Bewertet Konfigurationsobjekte nach Name, Typ und Aenderungsdatum. Fehlende Werte
    werden als Datenqualitaetsluecke markiert.

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
./28_Intune_Data_Quality/413_Get-IntunePolicyFieldCompletenessAudit.ps1 -OutputPath './reports/policy-field-gaps.csv'
```

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/28_Intune_Data_Quality/413_Get-IntunePolicyFieldCompletenessAudit.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
