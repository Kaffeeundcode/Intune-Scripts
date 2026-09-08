# Get-ExoMailboxForwardingRules

**Prüfstatus: Ungeprüft**

Prüft alle Mailboxen auf Weiterleitungsregeln (Inbox Rules).

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Weiterleitungen sind ein Sicherheitsrisiko (Data Exfiltration).
    Dieses Skript listet alle Regeln auf, die "ForwardTo" oder "RedirectTo" nutzen.
    Benötigt ExchangeOnlineManagement Modul (Connect-ExchangeOnline).

    Parameter:
    - UserPrincipalName: (Optional) Nur eine Mailbox prüfen.

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

Noch kein geprüftes Aufrufbeispiel dokumentiert. Parameter mit `Get-Help './04_M365_Exchange/061_Get-ExoMailboxForwardingRules.ps1' -Full` lesen.

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/04_M365_Exchange/061_Get-ExoMailboxForwardingRules.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
