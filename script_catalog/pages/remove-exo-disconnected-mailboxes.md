# Remove-ExoDisconnectedMailboxes

**Prüfstatus: Ungeprüft**

Entfernt "Disconnected" (gelöschte) Mailboxen endgültig.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Nach dem Löschen eines Users bleibt die Mailbox soft-deleted.
    Dieses Skript bereinigt diese sofort (Purge).
    VORSICHT: Daten sind dann weg!

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

Noch kein geprüftes Aufrufbeispiel dokumentiert. Parameter mit `Get-Help './04_M365_Exchange/068_Remove-ExoDisconnectedMailboxes.ps1' -Full` lesen.

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/04_M365_Exchange/068_Remove-ExoDisconnectedMailboxes.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
