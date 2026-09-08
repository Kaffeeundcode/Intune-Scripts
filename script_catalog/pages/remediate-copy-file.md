# Remediate-CopyFile

**Prüfstatus: Ungeprüft**

Kopiert eine Datei von einem Source-Pfad, falls sie fehlt.
    (Intune Remediation Script)

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Source kann ein Netzwerk-Share oder ein temporär abgelegtes File durch ein Win32 App Paket sein.

    Parameter:
    - SourcePath: Quelle
    - DestinationPath: Ziel

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

Noch kein geprüftes Aufrufbeispiel dokumentiert. Parameter mit `Get-Help './03_Intune_Remediations/056_Remediate-CopyFile.ps1' -Full` lesen.

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/03_Intune_Remediations/056_Remediate-CopyFile.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
