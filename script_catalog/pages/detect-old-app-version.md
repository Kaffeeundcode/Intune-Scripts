# Detect-OldAppVersion

**Prüfstatus: Ungeprüft**

Prüft, ob eine Applikation in einer veralteten Version installiert ist.
    (Intune Detection Script)

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Verleicht DisplayVersion aus der Registry mit einer Mindestversion.

    Parameter:
    - AppName: Name der Anwendung (Wildcard Match)
    - MinVersion: Mindestversion (z.B. 1.0.5)

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

Noch kein geprüftes Aufrufbeispiel dokumentiert. Parameter mit `Get-Help './03_Intune_Remediations/051_Detect-OldAppVersion.ps1' -Full` lesen.

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/03_Intune_Remediations/051_Detect-OldAppVersion.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
