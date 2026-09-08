# Get-ExoRoomMailboxEfficiency

**Prüfstatus: Ungeprüft**

Analyzes Room Mailbox usage and decline rates (Capacity Planning).

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Checks calendar stats for Room mailboxes.
    Note: Requires access to calendar data or usage logs.
    This script checks the 'BookingWindowInDays' and configuration, plus basic item count
    to infer usage intensity.

## Prüfung

Keine fachliche Freigabe aus der Katalogerstellung ableiten.

- static: aktueller erfolgreicher Nachweis fehlt
- pester: aktueller erfolgreicher Nachweis fehlt
- windows: aktueller erfolgreicher Nachweis fehlt
- tenant: aktueller erfolgreicher Nachweis fehlt

## Voraussetzungen

- Module: ExchangeOnlineManagement
- Dokumentierte Graph-Scopes: Nicht angegeben; vor Tenant-Nutzung prüfen.
- Hilfsdateien: Keine lokale Hilfsdatei erkannt.

## Verwendung

Noch kein geprüftes Aufrufbeispiel dokumentiert. Parameter mit `Get-Help './16_Mixed_New_Scripts/137_Get-ExoRoomMailboxEfficiency.ps1' -Full` lesen.

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/16_Mixed_New_Scripts/137_Get-ExoRoomMailboxEfficiency.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
