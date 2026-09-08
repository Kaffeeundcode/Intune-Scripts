# Get-AzVMAutoShutdownStatus

**Prüfstatus: Ungeprüft**

Prüft, ob für eine Azure VM der Auto-Shutdown konfiguriert ist.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Auto-Shutdown hilft Kosten zu sparen, besonders bei Dev/Test-Maschinen.
    Dieses Skript prüft den Status der Auto-Shutdown-Schedule für eine VM.

    Parameter:
    - ResourceGroupName: Die Ressourcengruppe der VM
    - VMName: Name der VM

## Prüfung

Keine fachliche Freigabe aus der Katalogerstellung ableiten.

- static: aktueller erfolgreicher Nachweis fehlt
- pester: aktueller erfolgreicher Nachweis fehlt
- windows: aktueller erfolgreicher Nachweis fehlt
- tenant: aktueller erfolgreicher Nachweis fehlt

## Voraussetzungen

- Module: Az
- Dokumentierte Graph-Scopes: Nicht angegeben; vor Tenant-Nutzung prüfen.
- Hilfsdateien: Keine lokale Hilfsdatei erkannt.

## Verwendung

Noch kein geprüftes Aufrufbeispiel dokumentiert. Parameter mit `Get-Help './01_Azure_Infrastructure/004_Get-AzVMAutoShutdownStatus.ps1' -Full` lesen.

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/01_Azure_Infrastructure/004_Get-AzVMAutoShutdownStatus.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
