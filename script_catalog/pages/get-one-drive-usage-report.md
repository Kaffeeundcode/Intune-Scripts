# Get-OneDriveUsageReport

**Prüfstatus: Ungeprüft**

Report über OneDrive Nutzung (Storage, File Count).

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Nutzt Graph API Report "getOneDriveUsageUserDetail".
    Zeigt, wer wie viel Speicher in OneDrive for Business belegt.

    Parameter:
    - Period: D7, D30, D90 (Default: D30)

## Prüfung

Keine fachliche Freigabe aus der Katalogerstellung ableiten.

- static: aktueller erfolgreicher Nachweis fehlt
- pester: aktueller erfolgreicher Nachweis fehlt
- windows: aktueller erfolgreicher Nachweis fehlt
- tenant: aktueller erfolgreicher Nachweis fehlt

## Voraussetzungen

- Module: Skript prüfen; keine Cloud-Module erkannt.
- Dokumentierte Graph-Scopes: Nicht angegeben; vor Tenant-Nutzung prüfen.
- Hilfsdateien: Keine lokale Hilfsdatei erkannt.

## Verwendung

Noch kein geprüftes Aufrufbeispiel dokumentiert. Parameter mit `Get-Help './04_M365_Exchange/076_Get-OneDriveUsageReport.ps1' -Full` lesen.

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/04_M365_Exchange/076_Get-OneDriveUsageReport.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
