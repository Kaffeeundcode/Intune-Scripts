# Remove-AzEmptyResourceGroups

**Prüfstatus: Ungeprüft**

Findet und löscht leere Resource Groups.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Leere RGs verschmutzen die Umgebung. Dieses Skript findet Gruppen ohne Ressourcen.
    Mit -Delete werden sie gelöscht.

    Parameter:
    - Delete: Switch zum Löschen.

## Prüfung

Keine fachliche Freigabe aus der Katalogerstellung ableiten.

- static: aktueller erfolgreicher Nachweis fehlt
- pester: aktueller erfolgreicher Nachweis fehlt
- windows: aktueller erfolgreicher Nachweis fehlt
- tenant: aktueller erfolgreicher Nachweis fehlt

## Voraussetzungen

- Module: Az
- Dokumentierte Graph-Scopes: Nicht angegeben; vor Tenant-Nutzung prüfen.
- Hilfsdateien: Keine lokale Hilfsdatei erkannt.

## Verwendung

Noch kein geprüftes Aufrufbeispiel dokumentiert. Parameter mit `Get-Help './01_Azure_Infrastructure/020_Remove-AzEmptyResourceGroups.ps1' -Full` lesen.

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/01_Azure_Infrastructure/020_Remove-AzEmptyResourceGroups.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
