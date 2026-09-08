# Get-IntuneMAMPolicyDeployment

**Prüfstatus: Ungeprüft**

Reports on Mobile Application Management (MAM) Policy deployments (App Protection).

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    App Protection Policies (MAM) are applied to users, unlike MDM which is device centric.
    This script lists all App Protection Policies and shows the count of targeted users
    and compliance status (if available via summary).

## Prüfung

Keine fachliche Freigabe aus der Katalogerstellung ableiten.

- static: aktueller erfolgreicher Nachweis fehlt
- pester: aktueller erfolgreicher Nachweis fehlt
- windows: aktueller erfolgreicher Nachweis fehlt
- tenant: aktueller erfolgreicher Nachweis fehlt

## Voraussetzungen

- Module: Microsoft.Graph.Authentication, Microsoft.Graph (passende SDK-Untermodule)
- Dokumentierte Graph-Scopes: DeviceManagementApps.Read.All
- Hilfsdateien: Keine lokale Hilfsdatei erkannt.

## Verwendung

Noch kein geprüftes Aufrufbeispiel dokumentiert. Parameter mit `Get-Help './16_Mixed_New_Scripts/110_Get-IntuneMAMPolicyDeployment.ps1' -Full` lesen.

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/16_Mixed_New_Scripts/110_Get-IntuneMAMPolicyDeployment.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
