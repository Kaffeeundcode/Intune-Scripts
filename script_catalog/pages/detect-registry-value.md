# Detect-RegistryValue

**Prüfstatus: Ungeprüft**

Prüft einen spezifischen Registry-Wert auf Compliance.
    (Intune Detection Script)

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Vergleicht Ist-Wert mit Soll-Wert.

    Parameter:
    - Path: Registry Pfad (HKLM:\...)
    - Name: Value Name
    - ExpectedValue: Erwarteter Wert

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

Noch kein geprüftes Aufrufbeispiel dokumentiert. Parameter mit `Get-Help './03_Intune_Remediations/057_Detect-RegistryValue.ps1' -Full` lesen.

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/03_Intune_Remediations/057_Detect-RegistryValue.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
