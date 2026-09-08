# Get-EntraIDUserMfaStatus

**Prüfstatus: Ungeprüft**

Report über registrierte MFA-Methoden pro Benutzer (nur Legacy/Per-User MFA Status).

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Zeigt an, ob MFA "Enabled" oder "Enforced" ist (Legacy Portal Einstellung).
    Für modernes Authentication Methods Reporting (Graph) wird ein anderes Cmdlet benötigt, welches komplexer ist.
    Dies hier ist für den schnellen Überblick über den "alten" Status hilfreich.

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

Noch kein geprüftes Aufrufbeispiel dokumentiert. Parameter mit `Get-Help './02_EntraID_Governance/035_Get-EntraIDUserMfaStatus.ps1' -Full` lesen.

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/02_EntraID_Governance/035_Get-EntraIDUserMfaStatus.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
