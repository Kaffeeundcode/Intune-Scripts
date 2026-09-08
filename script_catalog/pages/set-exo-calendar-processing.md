# Set-ExoCalendarProcessing

**Prüfstatus: Ungeprüft**

Konfiguriert die automatische Verarbeitung von Raumbuchungen.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Stellt sicher, dass Raumpostfächer Einladungen automatisch annehmen (AutoAccept).
    Entfernt außerdem den Betreff, wenn gewünscht (Privacy).

    Parameter:
    - Identity: Raumpostfach
    - AutoAccept: $true (Default)
    - AddOrganizerToSubject: $false (Default, Privacy)

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

Noch kein geprüftes Aufrufbeispiel dokumentiert. Parameter mit `Get-Help './04_M365_Exchange/078_Set-ExoCalendarProcessing.ps1' -Full` lesen.

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/04_M365_Exchange/078_Set-ExoCalendarProcessing.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
