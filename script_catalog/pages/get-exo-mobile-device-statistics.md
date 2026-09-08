# Get-ExoMobileDeviceStatistics

**Prüfstatus: Ungeprüft**

Listet alle mobilen Geräte (ActiveSync) auf, die mit Exchange verbunden sind.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Zeigt DeviceModel, OS und letzten Sync-Zeitpunkt.
    Unabhängig von Intune (nur Exchange ActiveSync Sicht).

    Parameter:
    - UserPrincipalName: (Optional) Filter auf User.

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

Noch kein geprüftes Aufrufbeispiel dokumentiert. Parameter mit `Get-Help './04_M365_Exchange/070_Get-ExoMobileDeviceStatistics.ps1' -Full` lesen.

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/04_M365_Exchange/070_Get-ExoMobileDeviceStatistics.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
