# Remove-EntraIDStaleDevices

**Prüfstatus: Ungeprüft**

Löscht verwaiste Geräte aus Entra ID (fka Azure AD) basierend auf dem 'ApproximateLastLogonTimeStamp'.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Entra ID Geräte müssen separat von Intune bereinigt werden.
    Dieses Skript identifiziert Geräte, die sich seit X Tagen nicht angemeldet haben.

    ACHTUNG: Löscht Geräte unwiderruflich!

    Parameter:
    - DaysInactive: Tage seit letztem Login (Default: 180)
    - Delete: Schalter zum Löschen. Ohne Switch nur Report.

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

Noch kein geprüftes Aufrufbeispiel dokumentiert. Parameter mit `Get-Help './02_EntraID_Governance/026_Remove-EntraIDStaleDevices.ps1' -Full` lesen.

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/02_EntraID_Governance/026_Remove-EntraIDStaleDevices.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
