# New-ScheduledTaskMaintenance

**Prüfstatus: Ungeprüft**

Creates a local Windows Scheduled Task to run weekly maintenance (Cleanup).

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Useful for deploying via Intune as a "Script" to ensure clients self-maintain.
    Task Actions:
    - Clear Temp
    - Windows Update Cleanup (Dism)

    Runs as SYSTEM.

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

Noch kein geprüftes Aufrufbeispiel dokumentiert. Parameter mit `Get-Help './16_Mixed_New_Scripts/143_New-ScheduledTaskMaintenance.ps1' -Full` lesen.

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/16_Mixed_New_Scripts/143_New-ScheduledTaskMaintenance.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
