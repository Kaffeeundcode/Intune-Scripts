# Get-AzAutomationVariable

**Prüfstatus: Ungeprüft**

Liest eine Variable aus Azure Automation aus (verschlüsselt oder unverschlüsselt).

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Dient dazu, Konfigurationswerte in Runbooks zu verwenden.

    Parameter:
    - AutomationAccountName: Account
    - ResourceGroupName: RG
    - Name: Variablenname

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

Noch kein geprüftes Aufrufbeispiel dokumentiert. Parameter mit `Get-Help './05_Azure_Automation/091_Get-AzAutomationVariable.ps1' -Full` lesen.

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/05_Azure_Automation/091_Get-AzAutomationVariable.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
