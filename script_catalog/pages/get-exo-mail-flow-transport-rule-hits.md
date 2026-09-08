# Get-ExoMailFlowTransportRuleHits

**Prüfstatus: Ungeprüft**

Exports Transport Rules and (where possible) analyzes if they are active.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Lists all Transport Rules with their priority, state, and actions.
    Note: Exact "Hit Count" is not directly exposed via simple cmdlet, but we can infer
    usage based on Message Trace correlation if needed.
    This script focuses on the Configuration audit part: Which rules enforce encryption, blocking, etc.

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

Noch kein geprüftes Aufrufbeispiel dokumentiert. Parameter mit `Get-Help './16_Mixed_New_Scripts/134_Get-ExoMailFlowTransportRuleHits.ps1' -Full` lesen.

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/16_Mixed_New_Scripts/134_Get-ExoMailFlowTransportRuleHits.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
