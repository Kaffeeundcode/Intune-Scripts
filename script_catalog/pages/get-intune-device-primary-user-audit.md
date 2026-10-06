# Get-IntuneDevicePrimaryUserAudit

**Prüfstatus: Ungeprüft**

Prueft im gesamten Tenant, ob Geraete einen zulaessigen Primary User haben.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Listet Windows- und macOS-Geraete ohne Primary User auf und prueft, ob der
    gemeldete Benutzername vom Geraetedatenobjekt abweicht. Bestehende Skripte
    lesen nur den Primary User eines einzelnen Geraetes; dieser Report analysiert
    die Abdeckung mandantenweit.

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
./18_Device_Inventory/371_Get-IntuneDevicePrimaryUserAudit.ps1 -OutputPath './reports/primary-user-audit.csv'
```

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/18_Device_Inventory/371_Get-IntuneDevicePrimaryUserAudit.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
