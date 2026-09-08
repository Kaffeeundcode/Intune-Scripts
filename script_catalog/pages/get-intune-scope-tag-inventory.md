# Get-IntuneScopeTagInventory

**Prüfstatus: Ungeprüft**

Audits the usage of Scope Tags across Intune objects.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Scope Tags are critical for RBAC (Role Based Access Control).
    This script retrieves all Scope Tags and then lists which Device Configs, Compliance Policies,
    and Scripts are tagged with them.

    Helps ensure that restrictions are correctly applied to objects.

## Prüfung

Keine fachliche Freigabe aus der Katalogerstellung ableiten.

- static: aktueller erfolgreicher Nachweis fehlt
- pester: aktueller erfolgreicher Nachweis fehlt
- windows: aktueller erfolgreicher Nachweis fehlt
- tenant: aktueller erfolgreicher Nachweis fehlt

## Voraussetzungen

- Module: Microsoft.Graph.Authentication, Microsoft.Graph (passende SDK-Untermodule)
- Dokumentierte Graph-Scopes: DeviceManagementRBAC.Read.All, DeviceManagementConfiguration.Read.All
- Hilfsdateien: Keine lokale Hilfsdatei erkannt.

## Verwendung

Noch kein geprüftes Aufrufbeispiel dokumentiert. Parameter mit `Get-Help './16_Mixed_New_Scripts/107_Get-IntuneScopeTagInventory.ps1' -Full` lesen.

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/16_Mixed_New_Scripts/107_Get-IntuneScopeTagInventory.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
