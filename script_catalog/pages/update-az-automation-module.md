# Update-AzAutomationModule

**Prüfstatus: Ungeprüft**

Aktualisiert ein PowerShell-Modul im Automation Account.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Module veralten und müssen gepflegt werden.
    Lädt die neueste Version aus der Gallery (indirekt Trigger via ContentLink).
    Hinweis: Azure Automation Module Updates sind oft einfacher via Portal,
    dieses Skript zeigt den Programmatic Way via New-AzAutomationModule (Overwrite).

    Parameter:
    - ResourceGroupName: RG
    - AutomationAccountName: Account
    - ModuleName: Name (z.B. Az.Accounts)
    - ContentLinkUri: URL zur .nupkg oder Gallery Link

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

Noch kein geprüftes Aufrufbeispiel dokumentiert. Parameter mit `Get-Help './05_Azure_Automation/097_Update-AzAutomationModule.ps1' -Full` lesen.

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/05_Azure_Automation/097_Update-AzAutomationModule.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
