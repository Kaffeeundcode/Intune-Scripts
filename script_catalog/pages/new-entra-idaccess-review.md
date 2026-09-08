# New-EntraIDAccessReview

**Prüfstatus: Ungeprüft**

Erstellt eine neue Access Review für eine Entra ID Gruppe.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Access Reviews zwingen Gruppenbesitzer, die Mitgliedschaften regelmäßig zu bestätigen.
    Dieses Skript erstellt eine Review für eine spezifische Gruppe.

    Parameter:
    - DisplayName: Name der Review
    - GroupId: ID der zu prüfenden Gruppe
    - ReviewerType: Wer prüft? (GroupOwner, SelectedUsers, Self)
    - DurationDays: Dauer in Tagen

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

Noch kein geprüftes Aufrufbeispiel dokumentiert. Parameter mit `Get-Help './02_EntraID_Governance/022_New-EntraIDAccessReview.ps1' -Full` lesen.

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/02_EntraID_Governance/022_New-EntraIDAccessReview.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
