# Get-SPOSiteStorageHighUsage

**Prüfstatus: Ungeprüft**

Listet SharePoint Sites auf, deren Speicher fast voll ist.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Prüft alle Site Collections und berechnet die Auslastung.
    Benötigt SharePoint Online Management Shell.

    Parameter:
    - WarnPercent: Warnschwelle in % (Default: 90)

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

Noch kein geprüftes Aufrufbeispiel dokumentiert. Parameter mit `Get-Help './04_M365_Exchange/063_Get-SPOSiteStorageHighUsage.ps1' -Full` lesen.

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/04_M365_Exchange/063_Get-SPOSiteStorageHighUsage.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
