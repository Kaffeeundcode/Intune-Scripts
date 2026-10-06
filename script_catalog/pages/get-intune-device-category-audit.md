# Get-IntuneDeviceCategoryAudit

**Prüfstatus: Ungeprüft**

Prueft Geradekategorien und listet Geraete ohne Kategorie.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Vergleicht die im Tenant definierten Geradekategorien mit der Kategoriezuweisung
    der Geraete. Geraete ohne Kategorie werden ausgegeben, damit Zielgruppenfilter
    und Reporting-Logiken verbessert werden koennen.

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
./18_Device_Inventory/372_Get-IntuneDeviceCategoryAudit.ps1 -OutputPath './reports/device-category-audit.csv'
```

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/18_Device_Inventory/372_Get-IntuneDeviceCategoryAudit.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
