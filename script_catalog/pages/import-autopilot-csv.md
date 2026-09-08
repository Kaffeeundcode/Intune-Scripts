# Import-AutopilotCSV

**Prüfstatus: Beispiel**

Importiert Autopilot-Geräte aus einer CSV (Hardware Hash).

<!-- library-status:start -->
    Prüfstatus: Beispiel
    Enthaelt Beispiel-/Platzhalterlogik; kein abgeschlossener Betriebsablauf.

    <!-- library-status:end -->

    Lädt eine CSV (Format: Device Serial Number,Windows Product ID,Hardware Hash) hoch.
    Hinweis: Der Import kann bis zu 15 Minuten dauern, bis er sichtbar ist.
    Erfordert die Berechtigung 'DeviceManagementServiceConfig.ReadWrite.All'.

## Prüfung

- Enthaelt Beispiel-/Platzhalterlogik; kein abgeschlossener Betriebsablauf.

- static: aktueller erfolgreicher Nachweis fehlt
- pester: aktueller erfolgreicher Nachweis fehlt
- windows: aktueller erfolgreicher Nachweis fehlt
- tenant: aktueller erfolgreicher Nachweis fehlt

## Voraussetzungen

- Module: Microsoft.Graph.Authentication, Microsoft.Graph (passende SDK-Untermodule)
- Dokumentierte Graph-Scopes: DeviceManagementServiceConfig.ReadWrite.All
- Hilfsdateien: Keine lokale Hilfsdatei erkannt.

## Verwendung

Noch kein geprüftes Aufrufbeispiel dokumentiert. Parameter mit `Get-Help './05_Enrollment_Autopilot/42_Import-AutopilotCSV.ps1' -Full` lesen.

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/05_Enrollment_Autopilot/42_Import-AutopilotCSV.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
