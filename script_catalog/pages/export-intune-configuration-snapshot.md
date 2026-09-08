# Export-IntuneConfigurationSnapshot

**Prüfstatus: Ungeprüft**

Exportiert klassische Profile, Settings Catalog, Compliance, Intents und ADMX-Konfigurationen mit Zuweisungen.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    JSON-Snapshot der aufgefuehrten Konfigurationsfamilien inklusive untergeordneter Einstellungen.
    Kein vollstaendiges Tenant-Backup: App-Payloads, Zertifikatsschluessel, Enrollment-Tokens und MAM sind nicht enthalten.
    Jeder Fehler setzt Complete auf false. Ausgaben koennen vertrauliche Konfiguration enthalten und gehoeren nicht ins oeffentliche Repository.

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
./17_Intune_Workflows/353_Export-IntuneConfigurationSnapshot.ps1 -OutputPath './reports/configuration.json'
```

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/17_Intune_Workflows/353_Export-IntuneConfigurationSnapshot.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
