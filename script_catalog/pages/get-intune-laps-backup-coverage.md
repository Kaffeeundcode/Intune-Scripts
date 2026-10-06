# Get-IntuneLapsBackupCoverage

**Prüfstatus: Ungeprüft**

Prueft die Abdeckung und Aktualitaet von Windows-LAPS-Sicherungen.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Vergleicht verwaltete Windows-Geraete mit den Metadaten aus
    directory/deviceLocalCredentials. Es werden keine lokalen Administratorkennwoerter
    oder Kennwortfelder abgerufen. Ein fehlender Eintrag ist ein Pruefhinweis und kann
    auch bedeuten, dass fuer das Geraet keine LAPS-Richtlinie vorgesehen ist.

## Prüfung

Keine fachliche Freigabe aus der Katalogerstellung ableiten.

- static: aktueller erfolgreicher Nachweis fehlt
- pester: aktueller erfolgreicher Nachweis fehlt
- windows: aktueller erfolgreicher Nachweis fehlt
- tenant: aktueller erfolgreicher Nachweis fehlt

## Voraussetzungen

- Module: Microsoft.Graph.Authentication
- Dokumentierte Graph-Scopes: DeviceManagementManagedDevices.Read.All, DeviceLocalCredential.ReadBasic.All
- Hilfsdateien: Keine lokale Hilfsdatei erkannt.

## Verwendung

```powershell
./17_Intune_Workflows/364_Get-IntuneLapsBackupCoverage.ps1 -MaximumBackupAgeDays 30 -OutputPath './reports/laps-coverage.csv'
```

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/17_Intune_Workflows/364_Get-IntuneLapsBackupCoverage.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
