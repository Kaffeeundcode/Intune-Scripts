# Get-IntuneWin32AppSupersedenceAudit

**Prüfstatus: Ungeprüft**

Prueft Supersedence-Beziehungen von Intune-Apps.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Listet Apps mit supersedingAppId oder supersededAppId und loest die beteiligten
    App-Namen auf. Das Skript bewertet nicht, ob eine Supersedence fachlich gewuenscht ist.

## Prüfung

Keine fachliche Freigabe aus der Katalogerstellung ableiten.

- static: aktueller erfolgreicher Nachweis fehlt
- pester: aktueller erfolgreicher Nachweis fehlt
- windows: aktueller erfolgreicher Nachweis fehlt
- tenant: aktueller erfolgreicher Nachweis fehlt

## Voraussetzungen

- Module: Microsoft.Graph.Authentication
- Dokumentierte Graph-Scopes: DeviceManagementApps.Read.All
- Hilfsdateien: Keine lokale Hilfsdatei erkannt.

## Verwendung

```powershell
./19_App_Ecosystem/375_Get-IntuneWin32AppSupersedenceAudit.ps1 -OutputPath './reports/app-supersedence.csv'
```

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/19_App_Ecosystem/375_Get-IntuneWin32AppSupersedenceAudit.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
