# Remove-AzDiagnosticSetting

**Prüfstatus: Ungeprüft**

Entfernt eine Diagnostic Setting Konfiguration von einer Ressource.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Bereinigt alte Log-Forwarding Regeln.

    Parameter:
    - ResourceId: ID der Azure Ressource
    - Name: Name des Diagnostic Settings

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

Noch kein geprüftes Aufrufbeispiel dokumentiert. Parameter mit `Get-Help './05_Azure_Automation/094_Remove-AzDiagnosticSetting.ps1' -Full` lesen.

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/05_Azure_Automation/094_Remove-AzDiagnosticSetting.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
