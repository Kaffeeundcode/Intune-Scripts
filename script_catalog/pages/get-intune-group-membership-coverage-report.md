# Get-IntuneGroupMembershipCoverageReport

**Prüfstatus: Ungeprüft**

Analysiert Gruppenabdeckung der verwalteten Geraete.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Listet Gruppen und prueft, ob sie Geraete, Benutzer oder beide enthalten. Gruppen ohne
    Mitglieder werden markiert, damit Zielgruppenlogik bereinigt werden kann.

## Prüfung

Keine fachliche Freigabe aus der Katalogerstellung ableiten.

- static: aktueller erfolgreicher Nachweis fehlt
- pester: aktueller erfolgreicher Nachweis fehlt
- windows: aktueller erfolgreicher Nachweis fehlt
- tenant: aktueller erfolgreicher Nachweis fehlt

## Voraussetzungen

- Module: Microsoft.Graph.Authentication
- Dokumentierte Graph-Scopes: Group.Read.All, DeviceManagementManagedDevices.Read.All
- Hilfsdateien: Keine lokale Hilfsdatei erkannt.

## Verwendung

```powershell
./23_User_Device_Mapping/394_Get-IntuneGroupMembershipCoverageReport.ps1 -OutputPath './reports/group-coverage.csv'
```

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/23_User_Device_Mapping/394_Get-IntuneGroupMembershipCoverageReport.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
