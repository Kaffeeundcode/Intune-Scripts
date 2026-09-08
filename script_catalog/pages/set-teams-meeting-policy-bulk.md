# Set-TeamsMeetingPolicyBulk

**Prüfstatus: Ungeprüft**

Weist eine Teams Meeting Policy einer Liste von Benutzern zu.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Bulk-Assignment von Policies ist oft schneller via PowerShell als im Admin Center.

    Parameter:
    - PolicyName: Name der Policy (z.B. "Global" oder Custom Name)
    - UserList: Array von UPNs (oder aus CSV importiert vor dem Aufruf).

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

Noch kein geprüftes Aufrufbeispiel dokumentiert. Parameter mit `Get-Help './04_M365_Exchange/062_Set-TeamsMeetingPolicyBulk.ps1' -Full` lesen.

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/04_M365_Exchange/062_Set-TeamsMeetingPolicyBulk.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
