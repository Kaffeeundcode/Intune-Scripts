# New-ExoRoomList

**Prüfstatus: Ungeprüft**

Erstellt eine Room List und fügt Räume hinzu.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Room Lists helfen im Outlook "Room Finder", Räume nach Standort/Gebäude zu gruppieren.

    Parameter:
    - ListName: Name der Liste (z.B. "Gebäude A")
    - ListEmail: E-Mail der Liste
    - Rooms: Array von Raum-Mailboxen zum Hinzufügen.

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

Noch kein geprüftes Aufrufbeispiel dokumentiert. Parameter mit `Get-Help './04_M365_Exchange/077_New-ExoRoomList.ps1' -Full` lesen.

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/04_M365_Exchange/077_New-ExoRoomList.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
