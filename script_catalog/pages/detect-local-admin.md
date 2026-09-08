# Detect-LocalAdmin

**Prüfstatus: Ungeprüft**

Prüft, ob unerwünschte Benutzer in der lokalen Administratorengruppe sind.
    (Intune Detection Script)

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Vergleicht die Mitglieder der Gruppe "Administrators" mit einer Allowed-List.
    NonCompliant, wenn Unbekannte gefunden werden.

    Parameter:
    - AllowedUsers: Kommagetrennte Liste von erlaubten Usern/SIDs (z.B. Administrator,Domain Admins).

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

Noch kein geprüftes Aufrufbeispiel dokumentiert. Parameter mit `Get-Help './03_Intune_Remediations/045_Detect-LocalAdmin.ps1' -Full` lesen.

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/03_Intune_Remediations/045_Detect-LocalAdmin.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
