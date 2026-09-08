# AI-GraphQuery-Wrapper

**Prüfstatus: Ungeprüft**

AI-GraphQuery-Wrapper - Translates natural language to Microsoft Graph OData filters.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Aus dem bestehenden GitHub-Bestand übernommen; fachliche und Tenant-Abnahme ausstehend.

    <!-- library-status:end -->

    This script leverages an LLM to convert human-readable requests into precise
    OData filter strings for Microsoft Graph API calls.

    Example Request: "All HP laptops that haven't synced in 30 days"
    Resulting Filter: "manufacturer eq 'HP' and lastSyncDateTime lt 2026-06-15T00:00:00Z"

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

Noch kein geprüftes Aufrufbeispiel dokumentiert. Parameter mit `Get-Help './17_AI_Automation/AI-GraphQuery-Wrapper.ps1' -Full` lesen.

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/17_AI_Automation/AI-GraphQuery-Wrapper.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
