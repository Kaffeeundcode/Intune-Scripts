# Get-IntuneAuditLogs

**Prüfstatus: Ungeprüft**

Ruft Intune Audit Logs ab.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Lädt die letzten Audit-Einträge (Wer hat was geändert?).
    Erfordert die Berechtigung 'DeviceManagementApps.Read.All' (audit logs falls accessible).
    Hinweis: Audit Logs benötigen oft spezielle Berechtigungen (AuditLog.Read.All).

## Prüfung

Keine fachliche Freigabe aus der Katalogerstellung ableiten.

- static: aktueller erfolgreicher Nachweis fehlt
- pester: aktueller erfolgreicher Nachweis fehlt
- windows: aktueller erfolgreicher Nachweis fehlt
- tenant: aktueller erfolgreicher Nachweis fehlt

## Voraussetzungen

- Module: Microsoft.Graph.Authentication, Microsoft.Graph (passende SDK-Untermodule)
- Dokumentierte Graph-Scopes: DeviceManagementApps.Read.All, AuditLog.Read.All
- Hilfsdateien: Keine lokale Hilfsdatei erkannt.

## Verwendung

Noch kein geprüftes Aufrufbeispiel dokumentiert. Parameter mit `Get-Help './06_Monitoring_Reporting/51_Get-IntuneAuditLogs.ps1' -Full` lesen.

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/06_Monitoring_Reporting/51_Get-IntuneAuditLogs.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
