# Get-AzRecoveryServicesBackupStatus

**Prüfstatus: Ungeprüft**

Prüft den Backup-Status aller VMs in einem Recovery Services Vault.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Zeigt an, welche VMs geschützt sind, wann das letzte Backup lief und ob es Fehler gab.

    Parameter:
    - ResourceGroupName: RG des Vaults
    - VaultName: Name des Recovery Services Vault

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

Noch kein geprüftes Aufrufbeispiel dokumentiert. Parameter mit `Get-Help './01_Azure_Infrastructure/015_Get-AzRecoveryServicesBackupStatus.ps1' -Full` lesen.

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/01_Azure_Infrastructure/015_Get-AzRecoveryServicesBackupStatus.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
