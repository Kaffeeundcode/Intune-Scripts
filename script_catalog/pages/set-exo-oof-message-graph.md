# Set-ExoOofMessageGraph

**Prüfstatus: Ungeprüft**

Setzt eine Abwesenheitsnotiz (Out of Office) via Graph API.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Alternativ zu Set-MailboxAutoReplyConfiguration (wenn kein EXO V2 verfügbar).
    Setzt Internal und External Message.

    Parameter:
    - UserPrincipalName: Ziel-User
    - Message: Nachrichtentext
    - StartTime/EndTime: Zeitraum

## Prüfung

Keine fachliche Freigabe aus der Katalogerstellung ableiten.

- static: aktueller erfolgreicher Nachweis fehlt
- pester: aktueller erfolgreicher Nachweis fehlt
- windows: aktueller erfolgreicher Nachweis fehlt
- tenant: aktueller erfolgreicher Nachweis fehlt

## Voraussetzungen

- Module: Microsoft.Graph (passende SDK-Untermodule)
- Dokumentierte Graph-Scopes: Nicht angegeben; vor Tenant-Nutzung prüfen.
- Hilfsdateien: Keine lokale Hilfsdatei erkannt.

## Verwendung

Noch kein geprüftes Aufrufbeispiel dokumentiert. Parameter mit `Get-Help './04_M365_Exchange/074_Set-ExoOofMessageGraph.ps1' -Full` lesen.

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/04_M365_Exchange/074_Set-ExoOofMessageGraph.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
