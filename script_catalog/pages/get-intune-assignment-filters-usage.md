# Get-IntuneAssignmentFiltersUsage

**Prüfstatus: Ungeprüft**

Maps Assignment Filters to the Applications and Policies that use them.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Assignment Filters are powerful but hard to track. This script retrieves all
    assignment filters and then queries Apps and Policies to find where they are referenced.

    It outputs a mapping of Filter -> Assigned Object Name -> Object Type.

## Prüfung

Keine fachliche Freigabe aus der Katalogerstellung ableiten.

- static: aktueller erfolgreicher Nachweis fehlt
- pester: aktueller erfolgreicher Nachweis fehlt
- windows: aktueller erfolgreicher Nachweis fehlt
- tenant: aktueller erfolgreicher Nachweis fehlt

## Voraussetzungen

- Module: Microsoft.Graph.Authentication, Microsoft.Graph (passende SDK-Untermodule)
- Dokumentierte Graph-Scopes: DeviceManagementApps.Read.All, DeviceManagementConfiguration.Read.All
- Hilfsdateien: Keine lokale Hilfsdatei erkannt.

## Verwendung

Noch kein geprüftes Aufrufbeispiel dokumentiert. Parameter mit `Get-Help './16_Mixed_New_Scripts/105_Get-IntuneAssignmentFiltersUsage.ps1' -Full` lesen.

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/16_Mixed_New_Scripts/105_Get-IntuneAssignmentFiltersUsage.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
