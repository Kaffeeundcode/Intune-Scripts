# Remove-EntraIDInvitedUsersNeverSignedIn

**Prüfstatus: Ungeprüft**

Löscht eingeladene Gast-Benutzer, die die Einladung nie angenommen haben.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Bereinigt das Directory von "Karteileichen" (offene Einladungen).
    Löscht Gäste, die im Status "PendingAcceptance" sind und älter als X Tage.

    Parameter:
    - DaysPending: Tage seit Einladung (Default: 60)
    - Delete: Lösch-Schalter.

## Prüfung

Keine fachliche Freigabe aus der Katalogerstellung ableiten.

- static: aktueller erfolgreicher Nachweis fehlt
- pester: aktueller erfolgreicher Nachweis fehlt
- windows: aktueller erfolgreicher Nachweis fehlt
- tenant: aktueller erfolgreicher Nachweis fehlt

## Voraussetzungen

- Module: Microsoft.Graph.Authentication, Microsoft.Graph (passende SDK-Untermodule)
- Dokumentierte Graph-Scopes: Nicht angegeben; vor Tenant-Nutzung prüfen.
- Hilfsdateien: Keine lokale Hilfsdatei erkannt.

## Verwendung

Noch kein geprüftes Aufrufbeispiel dokumentiert. Parameter mit `Get-Help './02_EntraID_Governance/036_Remove-EntraIDInvitedUsersNeverSignedIn.ps1' -Full` lesen.

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/02_EntraID_Governance/036_Remove-EntraIDInvitedUsersNeverSignedIn.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
