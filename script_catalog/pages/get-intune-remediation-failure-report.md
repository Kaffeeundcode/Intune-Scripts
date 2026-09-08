# Get-IntuneRemediationFailureReport

**Prüfstatus: Ungeprüft**

Fasst fehlgeschlagene oder nicht auswertbare Remediation-Laeufe zusammen.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Liest deviceHealthScripts und deviceRunStates aus Graph beta. Report enthaelt Fehlermeldungen, kein erfolgreiches Remediation-Signal aus leeren Abfragen.
    Detailausgaben koennen Benutzer-/Geraetedaten enthalten; nur im internen Reportordner speichern.

## Prüfung

Keine fachliche Freigabe aus der Katalogerstellung ableiten.

- static: aktueller erfolgreicher Nachweis fehlt
- pester: aktueller erfolgreicher Nachweis fehlt
- windows: aktueller erfolgreicher Nachweis fehlt
- tenant: aktueller erfolgreicher Nachweis fehlt

## Voraussetzungen

- Module: Microsoft.Graph.Authentication
- Dokumentierte Graph-Scopes: DeviceManagementConfiguration.Read.All
- Hilfsdateien: Keine lokale Hilfsdatei erkannt.

## Verwendung

```powershell
./17_Intune_Workflows/360_Get-IntuneRemediationFailureReport.ps1 -OutputPath './reports/remediations.json'
```

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/17_Intune_Workflows/360_Get-IntuneRemediationFailureReport.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
