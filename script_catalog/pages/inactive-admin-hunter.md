# Inactive-Admin-Hunter

**Prüfstatus: Ungeprüft**

Inactive-Admin-Hunter - Detects stale high-privileged accounts.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Aus dem bestehenden GitHub-Bestand übernommen; fachliche und Tenant-Abnahme ausstehend.

    <!-- library-status:end -->

    Identifies users with administrative roles who have not signed in for a
    defined period (e.g., 90 days), posing a security risk.

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

Noch kein geprüftes Aufrufbeispiel dokumentiert. Parameter mit `Get-Help './18_Security_Hardening/Inactive-Admin-Hunter.ps1' -Full` lesen.

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/18_Security_Hardening/Inactive-Admin-Hunter.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
