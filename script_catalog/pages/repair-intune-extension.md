# Repair-IntuneExtension

**Prüfstatus: Ungeprüft**

Versucht, Intune Management Extension (IME) Probleme zu beheben.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Restartet Dienst (lokales Skript, kein Graph).
    Dies muss auf dem Client ausgeführt werden.

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

Noch kein geprüftes Aufrufbeispiel dokumentiert. Parameter mit `Get-Help './08_Troubleshooting_Cleanup/80_Repair-IntuneExtension.ps1' -Full` lesen.

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/08_Troubleshooting_Cleanup/80_Repair-IntuneExtension.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
