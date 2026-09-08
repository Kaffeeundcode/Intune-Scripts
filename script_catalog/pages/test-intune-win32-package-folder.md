# Test-IntuneWin32PackageFolder

**Prüfstatus: Ungeprüft**

Prueft einen PilotDeploy-/PSADT-Paketordner vor der Intune-Verpackung.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Kontrolliert Einstiegspunkte, PE-Kennung, PowerShell-Syntax, Installer-Payload und Manifest.
    Reparse Points und vorhandene .intunewin-Ausgaben im Quellordner werden gemeldet.
    Fuehrt weder Installer noch Paketcode aus; erfolgreiche Strukturpruefung ist kein Installationstest.

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
./17_Intune_Workflows/356_Test-IntuneWin32PackageFolder.ps1 -PackagePath 'C:\TestPackages\7zip'
```

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/17_Intune_Workflows/356_Test-IntuneWin32PackageFolder.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
