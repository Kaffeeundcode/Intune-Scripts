# Test-IntuneWin32AppDetection

**Prüfstatus: Ungeprüft**

Prueft deklarative Datei-, Versions-, Registry- und MSI-Erkennung auf dem Zielgeraet.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    RulePath enthaelt ein JSON-Array aus type (file, fileVersion, registry, msi), path und optional minimumVersion,
    name, expectedValue, productCode sowie registryView (Registry64 oder Registry32).
    Es wird kein beliebiger Skriptinhalt ausgefuehrt. IntuneOutput liefert nur bei vollstaendig passender Erkennung Ausgabe und Exit 0.
    Exit 1 bedeutet nicht erkannt; Exit 2 bedeutet nicht pruefbar. Ohne IntuneOutput werden Ergebnisobjekte ausgegeben.

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
./17_Intune_Workflows/355_Test-IntuneWin32AppDetection.ps1 -RulePath './examples/detection-file.json'
```

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/17_Intune_Workflows/355_Test-IntuneWin32AppDetection.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
