# Zombie-Device-Hunter

**Prüfstatus: Ungeprüft**

Zombie-Device-Hunter - Identifies and manages stale devices in Intune.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Aus dem bestehenden GitHub-Bestand übernommen; fachliche und Tenant-Abnahme ausstehend.

    <!-- library-status:end -->

    Implements a 3-stage lifecycle process for inactive devices:
    Stage 1 (Detect): Find devices not synced for X days.
    Stage 2 (Warn): Mark for communication/notification.
    Stage laSt (Purge): Identify candidates for deletion.

## Prüfung

- Aus dem bestehenden GitHub-Bestand übernommen; fachliche und Tenant-Abnahme ausstehend.

- static: aktueller erfolgreicher Nachweis fehlt
- pester: aktueller erfolgreicher Nachweis fehlt
- windows: aktueller erfolgreicher Nachweis fehlt
- tenant: aktueller erfolgreicher Nachweis fehlt

## Voraussetzungen

- Module: Microsoft.Graph.Authentication, Microsoft.Graph (passende SDK-Untermodule)
- Dokumentierte Graph-Scopes: Nicht angegeben; vor Tenant-Nutzung prüfen.
- Hilfsdateien: Keine lokale Hilfsdatei erkannt.

## Verwendung

Noch kein geprüftes Aufrufbeispiel dokumentiert. Parameter mit `Get-Help './19_Lifecycle_Cleanup/Zombie-Device-Hunter.ps1' -Full` lesen.

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/19_Lifecycle_Cleanup/Zombie-Device-Hunter.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
