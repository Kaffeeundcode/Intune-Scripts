# Get-IntuneRbacRoleHygieneReport

**Prüfstatus: Ungeprüft**

Prueft breite und ungewoehnliche Intune-RBAC-Zuweisungen.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Listet Rollenzuweisungen mit Scope-Tags, Zielgruppen und Rollenname. Besonders
    Zuweisungen mit ScopeType AllDevices, AllLicensedUsers oder Default-Tag werden
    hervorgehoben.

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
./22_Governance/390_Get-IntuneRbacRoleHygieneReport.ps1 -OutputPath './reports/rbac-hygiene.csv'
```

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/22_Governance/390_Get-IntuneRbacRoleHygieneReport.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
