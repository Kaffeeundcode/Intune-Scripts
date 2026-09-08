# Get-AzAppServicePlanDensity

**Prüfstatus: Ungeprüft**

Calculates the density of App Services running per App Service Plan.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    App Service Plans (ASP) are the billing unit.
    If you have many ASPs with only 1 App each, you are paying for unused compute.
    This script finds ASPs with low density (e.g. < 2 apps) to suggest consolidation.

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

Noch kein geprüftes Aufrufbeispiel dokumentiert. Parameter mit `Get-Help './16_Mixed_New_Scripts/126_Get-AzAppServicePlanDensity.ps1' -Full` lesen.

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/16_Mixed_New_Scripts/126_Get-AzAppServicePlanDensity.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
