# Get-IntuneRbacRoleAssignmentAudit

**Prüfstatus: Ungeprüft**

Erstellt eine aufgeloeste Intune-RBAC-Zuweisungsmatrix.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Verknuepft Intune-Rollenzuweisungen mit Rollendefinition, Mitgliedergruppen,
    Ressourcengruppen, Scope-Typ und Scope Tags. Gruppen, die nicht gelesen werden
    koennen, bleiben mit ID als Nicht pruefbar sichtbar. Das Skript bewertet keine
    organisatorische Notwendigkeit und aendert keine Berechtigungen.

## Prüfung

Keine fachliche Freigabe aus der Katalogerstellung ableiten.

- static: aktueller erfolgreicher Nachweis fehlt
- pester: aktueller erfolgreicher Nachweis fehlt
- windows: aktueller erfolgreicher Nachweis fehlt
- tenant: aktueller erfolgreicher Nachweis fehlt

## Voraussetzungen

- Module: Microsoft.Graph.Authentication
- Dokumentierte Graph-Scopes: DeviceManagementRBAC.Read.All, Group.Read.All
- Hilfsdateien: Keine lokale Hilfsdatei erkannt.

## Verwendung

```powershell
./17_Intune_Workflows/366_Get-IntuneRbacRoleAssignmentAudit.ps1 -OutputPath './reports/intune-rbac.csv'
```

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/17_Intune_Workflows/366_Get-IntuneRbacRoleAssignmentAudit.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
