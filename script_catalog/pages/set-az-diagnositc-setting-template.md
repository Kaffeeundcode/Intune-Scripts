# Set-AzDiagnositcSettingTemplate

**Prüfstatus: Ungeprüft**

Erstellt Diagnostic Settings für eine Ressource (Logs an Log Analytics senden).

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Aktiviert das Senden von Logs und Metriken an einen Log Analytics Workspace.

    Parameter:
    - ResourceId: ID der Zielressource (z.B. KeyVault, NIC, LB)
    - WorkspaceId: ID des Log Analytics Workspace
    - SettingName: Name des Settings (Default: 'Send-To-Laws')

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

Noch kein geprüftes Aufrufbeispiel dokumentiert. Parameter mit `Get-Help './01_Azure_Infrastructure/018_Set-AzDiagnositcSettingTemplate.ps1' -Full` lesen.

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/01_Azure_Infrastructure/018_Set-AzDiagnositcSettingTemplate.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
