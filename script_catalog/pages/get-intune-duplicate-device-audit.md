# Get-IntuneDuplicateDeviceAudit

**Prüfstatus: Ungeprüft**

Findet doppelte Geraete-Identifikatoren.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Prueft Geraete auf doppelte Seriennummern, Geraetenamen oder AzureAD-IDs.
    Doppelte IDs sind ein Hinweis auf Import- oder Registrierungsfehler.

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
./28_Intune_Data_Quality/411_Get-IntuneDuplicateDeviceAudit.ps1 -OutputPath './reports/duplicate-devices.csv'
```

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/28_Intune_Data_Quality/411_Get-IntuneDuplicateDeviceAudit.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
