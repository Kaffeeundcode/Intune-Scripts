# Self-Service-Enrollment-Fix

**Prüfstatus: Ungeprüft**

Self-Service-Enrollment-Fix - Diagnostics for Autopilot/Enrollment failures.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Aus dem bestehenden GitHub-Bestand übernommen; fachliche und Tenant-Abnahme ausstehend.

    <!-- library-status:end -->

    Checks for common enrollment blockers:
    - Duplicate device records
    - Pending Autopilot registrations
    - Local policy conflicts

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

Noch kein geprüftes Aufrufbeispiel dokumentiert. Parameter mit `Get-Help './20_User_SelfService/Self-Service-Enrollment-Fix.ps1' -Full` lesen.

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/20_User_SelfService/Self-Service-Enrollment-Fix.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
