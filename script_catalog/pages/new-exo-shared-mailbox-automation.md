# New-ExoSharedMailboxAutomation

**Prüfstatus: Ungeprüft**

Erstellt eine Shared Mailbox und weist direkt Vollzugriff zu.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Standardisiert die Erstellung von Shared Mailboxes.

    Parameter:
    - Name: Display Name
    - Email: Primäre SMTP Adresse
    - FullAccessUsers: Liste von UPNs für Full Access

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

Noch kein geprüftes Aufrufbeispiel dokumentiert. Parameter mit `Get-Help './04_M365_Exchange/064_New-ExoSharedMailboxAutomation.ps1' -Full` lesen.

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/04_M365_Exchange/064_New-ExoSharedMailboxAutomation.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
