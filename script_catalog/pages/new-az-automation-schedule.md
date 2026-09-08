# New-AzAutomationSchedule

**Prüfstatus: Ungeprüft**

Erstellt einen Zeitplan (Schedule) in Azure Automation.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Schedules triggern Runbooks zu bestimmten Zeiten.

    Parameter:
    - Name: Schedule Name
    - StartTime: Wann geht es los?
    - DaysInterval: Alle X Tage (Default: 1 = täglich)

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

Noch kein geprüftes Aufrufbeispiel dokumentiert. Parameter mit `Get-Help './05_Azure_Automation/096_New-AzAutomationSchedule.ps1' -Full` lesen.

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/05_Azure_Automation/096_New-AzAutomationSchedule.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
