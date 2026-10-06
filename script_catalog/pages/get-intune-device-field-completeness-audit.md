# Get-IntuneDeviceFieldCompletenessAudit

**Prüfstatus: Ungeprüft**

Prueft Pflichtfelder in Geraetedaten.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Bewertet Geraetedaten nach Pflichtfeldern wie Seriennummer, Modell, Hersteller, OS und Sync-Datum.
    Lueckenhafte Objekte werden als Auffaellig markiert.

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
./28_Intune_Data_Quality/412_Get-IntuneDeviceFieldCompletenessAudit.ps1 -OutputPath './reports/device-field-gaps.csv'
```

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/28_Intune_Data_Quality/412_Get-IntuneDeviceFieldCompletenessAudit.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
