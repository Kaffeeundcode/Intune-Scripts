# Get-IntuneRetirementCandidateReport

**Prüfstatus: Ungeprüft**

Findet Geraete, die fuer eine Stilllegung geprueft werden sollten.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Kombiniert Sync-Alter, Compliance-Zustand und Management-Zustand. Das Skript
    loescht oder aendert keine Geraete.

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
./26_Lifecycle_Gaps/404_Get-IntuneRetirementCandidateReport.ps1 -OutputPath './reports/retirement-candidates.csv'
```

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/26_Lifecycle_Gaps/404_Get-IntuneRetirementCandidateReport.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
