# Get-InstalledSoftwareFuzzy

**Prüfstatus: Ungeprüft**

Searches installed software (Registry) using fuzzy matching/wildcards.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    "Get-Package" or "Get-WmiObject" can be slow or incomplete.
    This script quickly scans Uninstall keys in Registry for a keyword (e.g. "Adobe", "Java").

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

Noch kein geprüftes Aufrufbeispiel dokumentiert. Parameter mit `Get-Help './16_Mixed_New_Scripts/149_Get-InstalledSoftwareFuzzy.ps1' -Full` lesen.

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/16_Mixed_New_Scripts/149_Get-InstalledSoftwareFuzzy.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
