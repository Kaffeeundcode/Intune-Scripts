# Get-EntraIDConditionalAccessGaps

**Prüfstatus: Ungeprüft**

Identifies users who are NOT covered by specific critical Conditional Access policies.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Checks all Enabled CA policies.
    If a policy targets "All Users" but has Exclusions, it lists the Excluded users.
    If a policy targets specific groups, it's harder to check gaps without a "baseline".

    Focus: Finding users consistently excluded from MFA or Block Legacy Auth rules.

## Prüfung

Keine fachliche Freigabe aus der Katalogerstellung ableiten.

- static: aktueller erfolgreicher Nachweis fehlt
- pester: aktueller erfolgreicher Nachweis fehlt
- windows: aktueller erfolgreicher Nachweis fehlt
- tenant: aktueller erfolgreicher Nachweis fehlt

## Voraussetzungen

- Module: Microsoft.Graph.Authentication, Microsoft.Graph (passende SDK-Untermodule)
- Dokumentierte Graph-Scopes: Policy.Read.All, Group.Read.All, User.Read.All
- Hilfsdateien: Keine lokale Hilfsdatei erkannt.

## Verwendung

Noch kein geprüftes Aufrufbeispiel dokumentiert. Parameter mit `Get-Help './16_Mixed_New_Scripts/117_Get-EntraIDConditionalAccessGaps.ps1' -Full` lesen.

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/16_Mixed_New_Scripts/117_Get-EntraIDConditionalAccessGaps.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
