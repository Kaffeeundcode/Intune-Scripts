# Remediate-SetRegistryValue

**Prüfstatus: Ungeprüft**

Setzt einen Registry-Wert.
    (Intune Remediation Script)

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Erstellt den Key falls nötig und setzt den Wert.

    Parameter:
    - Path: Registry Pfad
    - Name: Value Name
    - Value: Der zu setzende Wert
    - Type: PropertyType (String, DWord etc.) - Default: String

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

Noch kein geprüftes Aufrufbeispiel dokumentiert. Parameter mit `Get-Help './03_Intune_Remediations/058_Remediate-SetRegistryValue.ps1' -Full` lesen.

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/03_Intune_Remediations/058_Remediate-SetRegistryValue.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
