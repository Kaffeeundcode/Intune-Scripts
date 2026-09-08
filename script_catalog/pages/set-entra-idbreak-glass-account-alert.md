# Set-EntraIDBreakGlassAccountAlert

**Prüfstatus: Ungeprüft**

Erstellt eine Log Analytics Alert Rule für Login-Versuche des Break-Glass Accounts.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Der "Notfall-Admin" (Break Glass) sollte niemals genutzt werden. Wenn doch, muss sofort Alarm geschlagen werden.
    Dieses Skript erstellt eine Alert Rule in Azure Monitor.

    Parameter:
    - BreakGlassUPN: UPN des Notfall-Admins
    - WorkspaceId: Log Analytics Workspace ID

## Prüfung

Keine fachliche Freigabe aus der Katalogerstellung ableiten.

- static: aktueller erfolgreicher Nachweis fehlt
- pester: aktueller erfolgreicher Nachweis fehlt
- windows: aktueller erfolgreicher Nachweis fehlt
- tenant: aktueller erfolgreicher Nachweis fehlt

## Voraussetzungen

- Module: Skript prüfen; keine Cloud-Module erkannt.
- Dokumentierte Graph-Scopes: Nicht angegeben; vor Tenant-Nutzung prüfen.
- Hilfsdateien: Keine lokale Hilfsdatei erkannt.

## Verwendung

Noch kein geprüftes Aufrufbeispiel dokumentiert. Parameter mit `Get-Help './02_EntraID_Governance/024_Set-EntraIDBreakGlassAccountAlert.ps1' -Full` lesen.

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/02_EntraID_Governance/024_Set-EntraIDBreakGlassAccountAlert.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
