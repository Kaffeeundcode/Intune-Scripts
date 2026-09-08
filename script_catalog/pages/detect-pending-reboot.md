# Detect-PendingReboot

**Prüfstatus: Ungeprüft**

Prüft, ob ein Neustart ausstehend ist (Pending Reboot).
    (Intune Detection Script)

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Prüft diverse Registry-Keys (Component Based Servicing, Windows Update, Session Manager).
    NonCompliant wenn ein Reboot nötig ist.

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

Noch kein geprüftes Aufrufbeispiel dokumentiert. Parameter mit `Get-Help './03_Intune_Remediations/049_Detect-PendingReboot.ps1' -Full` lesen.

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/03_Intune_Remediations/049_Detect-PendingReboot.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
