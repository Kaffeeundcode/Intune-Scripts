# Get-IntuneDeviceHardwareSummary

**Prüfstatus: Ungeprüft**

Erstellt eine vollstaendige Hardware-Inventur aller Intune-Geraete.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Liest alle verwalteten Geraete und aggregiert Hersteller, Modell, Betriebssystem,
    Speichervariante und Sync-Status. Im Gegensatz zu 59_Get-DeviceModelSummary.ps1
    entsteht eine exportierbare Inventur mit Geraetedetails, nicht nur eine
    Modellzaehlung.

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
./18_Device_Inventory/370_Get-IntuneDeviceHardwareSummary.ps1 -OutputPath './reports/hardware-inventory.csv'
```

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/18_Device_Inventory/370_Get-IntuneDeviceHardwareSummary.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
