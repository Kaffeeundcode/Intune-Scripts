# Set-TeamsPrivateChannelLifecycle

**Prüfstatus: Ungeprüft**

Archives or alerts on Teams Private Channels with no recent activity.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Private channels have their own separate SharePoint sites.
    When a Team is archived, private channels might remain ignored.
    This script finds private channels where the underlying site has not been modified recently.

## Prüfung

Keine fachliche Freigabe aus der Katalogerstellung ableiten.

- static: aktueller erfolgreicher Nachweis fehlt
- pester: aktueller erfolgreicher Nachweis fehlt
- windows: aktueller erfolgreicher Nachweis fehlt
- tenant: aktueller erfolgreicher Nachweis fehlt

## Voraussetzungen

- Module: Microsoft.Graph.Authentication, Microsoft.Graph (passende SDK-Untermodule)
- Dokumentierte Graph-Scopes: Group.Read.All, Sites.Read.All, ChannelMember.Read.All
- Hilfsdateien: Keine lokale Hilfsdatei erkannt.

## Verwendung

Noch kein geprüftes Aufrufbeispiel dokumentiert. Parameter mit `Get-Help './16_Mixed_New_Scripts/133_Set-TeamsPrivateChannelLifecycle.ps1' -Full` lesen.

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/16_Mixed_New_Scripts/133_Set-TeamsPrivateChannelLifecycle.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
