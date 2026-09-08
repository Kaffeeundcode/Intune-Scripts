# Get-AzResourceChangeHistory

**Prüfstatus: Ungeprüft**

Summarizes "Who changed what" in the last 24 hours via Activity Log.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Filters Azure Activity Log for 'Write', 'Delete', or 'Action' events.
    Groups them by Caller (User) and Resource.

    Quick way to catch "Who turned off the VM?" or "Who modified the NSG?".

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

Noch kein geprüftes Aufrufbeispiel dokumentiert. Parameter mit `Get-Help './16_Mixed_New_Scripts/125_Get-AzResourceChangeHistory.ps1' -Full` lesen.

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/16_Mixed_New_Scripts/125_Get-AzResourceChangeHistory.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
