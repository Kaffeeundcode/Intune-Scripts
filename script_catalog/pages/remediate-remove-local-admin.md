# Remediate-RemoveLocalAdmin

**Prüfstatus: Ungeprüft**

Entfernt unerwünschte lokale Administratoren.
    (Intune Remediation Script)

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Entfernt alle User aus der Admin-Gruppe, die nicht auf der Allowed-Liste stehen.
    VORSICHT: Kann Admin-Rechte entziehen!

    Parameter:
    - AllowedUsers: Liste der User, die BLEIBEN dürfen.

## Prüfung

Keine fachliche Freigabe aus der Katalogerstellung ableiten.

- static: aktueller erfolgreicher Nachweis fehlt
- pester: aktueller erfolgreicher Nachweis fehlt
- windows: aktueller erfolgreicher Nachweis fehlt

## Voraussetzungen

- Module: Skript prüfen; keine Cloud-Module erkannt.
- Dokumentierte Graph-Scopes: Nicht angegeben; vor Tenant-Nutzung prüfen.
- Hilfsdateien: Keine lokale Hilfsdatei erkannt.

## Verwendung

Noch kein geprüftes Aufrufbeispiel dokumentiert. Parameter mit `Get-Help './03_Intune_Remediations/046_Remediate-RemoveLocalAdmin.ps1' -Full` lesen.

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/03_Intune_Remediations/046_Remediate-RemoveLocalAdmin.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
