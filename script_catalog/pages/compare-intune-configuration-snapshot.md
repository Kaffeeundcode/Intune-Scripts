# Compare-IntuneConfigurationSnapshot

**Prüfstatus: Ungeprüft**

Vergleicht zwei vollstaendige Konfigurationssnapshots desselben Tenants.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Zeigt hinzugefuegte, entfernte und geaenderte Objekte anhand Family und Id.
    Eigenschaften werden rekursiv sortiert; Arrayreihenfolge bleibt erhalten, da sie fachlich relevant sein kann.
    API-Metadaten und Zeitstempel werden nicht als Konfigurationsaenderung gewertet.

## Prüfung

Keine fachliche Freigabe aus der Katalogerstellung ableiten.

- static: aktueller erfolgreicher Nachweis fehlt
- pester: aktueller erfolgreicher Nachweis fehlt
- windows: aktueller erfolgreicher Nachweis fehlt

## Voraussetzungen

- Module: Microsoft.Graph.Authentication
- Dokumentierte Graph-Scopes: Nicht angegeben; vor Tenant-Nutzung prüfen.
- Hilfsdateien: Keine lokale Hilfsdatei erkannt.

## Verwendung

```powershell
./17_Intune_Workflows/354_Compare-IntuneConfigurationSnapshot.ps1 -BeforePath './reports/before.json' -AfterPath './reports/after.json'
```

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/17_Intune_Workflows/354_Compare-IntuneConfigurationSnapshot.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
