# Get-IntuneDeviceUserAssignmentGapReport

**Prüfstatus: Ungeprüft**

Findet Geraete ohne eindeutige Benutzerzuordnung.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Listet Geraete ohne Primary User oder mit mehreren moeglichen Zuordnungen. Das Skript
    dient der Qualitaetssicherung fuer Support, Self-Service und Reporting.

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
./23_User_Device_Mapping/393_Get-IntuneDeviceUserAssignmentGapReport.ps1 -OutputPath './reports/device-user-gaps.csv'
```

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/23_User_Device_Mapping/393_Get-IntuneDeviceUserAssignmentGapReport.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
