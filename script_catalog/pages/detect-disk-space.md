# Detect-DiskSpace

**Prüfstatus: Ungeprüft**

Erkennt, ob der freie Speicherplatz auf C: unter einem Schwellenwert liegt.
    (Intune Detection Script)

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Ausgabe "NonCompliant", wenn Speicher < Threshold.
    Sonst "Compliant".

    Parameter:
    - ThresholdPercent: Warnschwelle in % (Default: 10)

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

Noch kein geprüftes Aufrufbeispiel dokumentiert. Parameter mit `Get-Help './03_Intune_Remediations/041_Detect-DiskSpace.ps1' -Full` lesen.

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/03_Intune_Remediations/041_Detect-DiskSpace.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
