# Get-EntraIDPIMAlerts

**Prüfstatus: Ungeprüft**

Ruft aktive PIM (Privileged Identity Management) Alerts ab.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Zeigt Sicherheitswarnungen aus PIM an, z.B. wenn Administratoren keine MFA nutzen
    oder Rollen außerhalb von PIM zugewiesen wurden.
    Benötigt Microsoft.Graph.Identity.Governance Modul.

    Parameter:
    - AlertLevel: (Optional) Filtert nach Schweregrad (High, Medium, Low). Default: Alle.

## Prüfung

Keine fachliche Freigabe aus der Katalogerstellung ableiten.

- static: aktueller erfolgreicher Nachweis fehlt
- pester: aktueller erfolgreicher Nachweis fehlt
- windows: aktueller erfolgreicher Nachweis fehlt
- tenant: aktueller erfolgreicher Nachweis fehlt

## Voraussetzungen

- Module: Microsoft.Graph.Authentication
- Dokumentierte Graph-Scopes: Nicht angegeben; vor Tenant-Nutzung prüfen.
- Hilfsdateien: Keine lokale Hilfsdatei erkannt.

## Verwendung

Noch kein geprüftes Aufrufbeispiel dokumentiert. Parameter mit `Get-Help './02_EntraID_Governance/021_Get-EntraIDPIMAlerts.ps1' -Full` lesen.

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/02_EntraID_Governance/021_Get-EntraIDPIMAlerts.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
