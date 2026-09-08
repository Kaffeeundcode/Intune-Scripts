# Stale-Group-Purge

**Prüfstatus: Ungeprüft**

Stale-Group-Purge - Cleans up empty or orphaned groups in Entra ID.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Aus dem bestehenden GitHub-Bestand übernommen; fachliche und Tenant-Abnahme ausstehend.

    <!-- library-status:end -->

    Scans for groups that have zero members or no assigned owners,
    reducing clutter and improving security posture.

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

Noch kein geprüftes Aufrufbeispiel dokumentiert. Parameter mit `Get-Help './19_Lifecycle_Cleanup/Stale-Group-Purge.ps1' -Full` lesen.

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/19_Lifecycle_Cleanup/Stale-Group-Purge.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
