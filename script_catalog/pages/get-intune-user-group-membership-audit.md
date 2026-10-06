# Get-IntuneUserGroupMembershipAudit

**Prüfstatus: Ungeprüft**

Prueft Benutzer-Geräte- und Gruppenzugehoerigkeit.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Listet Benutzer mit zugeordneten Geraeten und deren Gruppenzugehoerigkeit. Ziel ist
    eine schnelle Kontrolle von Zielgruppenlogik und Geraetebindung.

## Prüfung

Keine fachliche Freigabe aus der Katalogerstellung ableiten.

- static: aktueller erfolgreicher Nachweis fehlt
- pester: aktueller erfolgreicher Nachweis fehlt
- windows: aktueller erfolgreicher Nachweis fehlt
- tenant: aktueller erfolgreicher Nachweis fehlt

## Voraussetzungen

- Module: Microsoft.Graph.Authentication
- Dokumentierte Graph-Scopes: DeviceManagementManagedDevices.Read.All, Group.Read.All, User.Read.All
- Hilfsdateien: Keine lokale Hilfsdatei erkannt.

## Verwendung

```powershell
./23_User_Device_Mapping/392_Get-IntuneUserGroupMembershipAudit.ps1 -OutputPath './reports/user-group-audit.csv'
```

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/23_User_Device_Mapping/392_Get-IntuneUserGroupMembershipAudit.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
