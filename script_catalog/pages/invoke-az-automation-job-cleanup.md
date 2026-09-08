# Invoke-AzAutomationJobCleanup

**Prüfstatus: Ungeprüft**

Maintenance script to clean up old Automation Job history.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Azure Automation keeps job logs which can be noisy.
    This script finds jobs older than X days and effectively clears them from view
    (though archiving is native, this is for operational dashboard cleanup).

    Note: Can't delete jobs via simple cmdlet easily, often used to just export-and-purge logic.
    Here we focus on identifying the purge candidates.

## Prüfung

Keine fachliche Freigabe aus der Katalogerstellung ableiten.

- static: aktueller erfolgreicher Nachweis fehlt
- pester: aktueller erfolgreicher Nachweis fehlt
- windows: aktueller erfolgreicher Nachweis fehlt
- tenant: aktueller erfolgreicher Nachweis fehlt

## Voraussetzungen

- Module: Az
- Dokumentierte Graph-Scopes: Nicht angegeben; vor Tenant-Nutzung prüfen.
- Hilfsdateien: Keine lokale Hilfsdatei erkannt.

## Verwendung

Noch kein geprüftes Aufrufbeispiel dokumentiert. Parameter mit `Get-Help './16_Mixed_New_Scripts/141_Invoke-AzAutomationJobCleanup.ps1' -Full` lesen.

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/16_Mixed_New_Scripts/141_Invoke-AzAutomationJobCleanup.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
