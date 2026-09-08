# New-EntraIDConditionalAccessPolicyJson

**Prüfstatus: Ungeprüft**

Exportiert alle Conditional Access Policies als JSON-Dateien (Backup).

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Sichert die CA-Regelwerke lokal, um sie zu dokumentieren oder wiederherzustellen.

    Parameter:
    - OutputFolder: Zielordner (Default: Desktop/CA-Backup)

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

Noch kein geprüftes Aufrufbeispiel dokumentiert. Parameter mit `Get-Help './02_EntraID_Governance/033_New-EntraIDConditionalAccessPolicyJson.ps1' -Full` lesen.

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/02_EntraID_Governance/033_New-EntraIDConditionalAccessPolicyJson.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
