# New-AzAutomationRunbookImport

**Prüfstatus: Ungeprüft**

Importiert ein lokales PowerShell-Skript als Runbook in Azure Automation.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Automatisierter Deployment-Prozess für Runbooks.

    Parameter:
    - ResourceGroupName: RG Name
    - AutomationAccountName: Automation Account Name
    - Path: Pfad zur lokalen .ps1 Datei
    - RunbookName: Name in Azure (Default: Dateiname ohne .ps1)

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

Noch kein geprüftes Aufrufbeispiel dokumentiert. Parameter mit `Get-Help './05_Azure_Automation/082_New-AzAutomationRunbookImport.ps1' -Full` lesen.

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/05_Azure_Automation/082_New-AzAutomationRunbookImport.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
