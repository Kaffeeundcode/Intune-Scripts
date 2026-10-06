# Get-IntuneSecurityTaskGapReport

**Prüfstatus: Ungeprüft**

Listet offene Intune-Sicherheitsaufgaben.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Liest deviceManagement/securityTasks und bewertet Status und Verantwortlichkeit.

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
./31_Intune_Security_Compliance_Gaps/426_Get-IntuneSecurityTaskGapReport.ps1 -OutputPath './reports/security-task-gaps.csv'
```

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/31_Intune_Security_Compliance_Gaps/426_Get-IntuneSecurityTaskGapReport.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
