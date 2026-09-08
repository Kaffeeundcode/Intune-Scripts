# Set-AzSqlDatabaseAuditing

**Prüfstatus: Ungeprüft**

Aktiviert das Blob-Auditing für einen Azure SQL Server.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Aktiviert Auditing für einen gesamten logischen SQL Server und speichert die Audit-Logs in einem Storage Account.
    Dies ist wichtig für Compliance und Security-Überwachung.

    Parameter:
    - ResourceGroupName: RG des SQL Servers
    - ServerName: Name des SQL Servers
    - StorageAccountName: Ziel-Storage Account für Audit Logs

## Prüfung

Keine fachliche Freigabe aus der Katalogerstellung ableiten.

- static: aktueller erfolgreicher Nachweis fehlt
- pester: aktueller erfolgreicher Nachweis fehlt
- windows: aktueller erfolgreicher Nachweis fehlt
- tenant: aktueller erfolgreicher Nachweis fehlt

## Voraussetzungen

- Module: Az
- Dokumentierte Graph-Scopes: Nicht angegeben; vor Tenant-Nutzung prüfen.
- Hilfsdateien: Keine lokale Hilfsdatei erkannt.

## Verwendung

Noch kein geprüftes Aufrufbeispiel dokumentiert. Parameter mit `Get-Help './01_Azure_Infrastructure/009_Set-AzSqlDatabaseAuditing.ps1' -Full` lesen.

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/01_Azure_Infrastructure/009_Set-AzSqlDatabaseAuditing.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
