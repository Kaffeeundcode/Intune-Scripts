# Get-IntuneDeviceOwnershipAudit

**Prüfstatus: Ungeprüft**

Analysiert die Ownership-Kennzeichnung aller verwalteten Geraete.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Zaehlt Geraete nach managedDeviceOwnerType und listet personal-markierte Geraete,
    damit Firmen- und BYOD-Grenzen kontrolliert werden koennen. Das Skript aendert
    keine Zuordnung und bewertet nicht automatisch, ob eine Markierung falsch ist.

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
./18_Device_Inventory/374_Get-IntuneDeviceOwnershipAudit.ps1 -OutputPath './reports/ownership-audit.csv'
```

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/18_Device_Inventory/374_Get-IntuneDeviceOwnershipAudit.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
