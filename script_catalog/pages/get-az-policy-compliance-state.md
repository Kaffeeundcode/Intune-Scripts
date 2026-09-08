# Get-AzPolicyComplianceState

**Prüfstatus: Ungeprüft**

Ruft den Compliance-Status von Azure Policies für eine Subscription oder Ressource ab.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Zeigt an, ob Ressourcen "Compliant" oder "NonCompliant" sind.

    Parameter:
    - Scope: (Optional) Scope (Subscription ID oder RG Pfad). Default: Aktuelle Subscription.

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

Noch kein geprüftes Aufrufbeispiel dokumentiert. Parameter mit `Get-Help './01_Azure_Infrastructure/019_Get-AzPolicyComplianceState.ps1' -Full` lesen.

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/01_Azure_Infrastructure/019_Get-AzPolicyComplianceState.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
