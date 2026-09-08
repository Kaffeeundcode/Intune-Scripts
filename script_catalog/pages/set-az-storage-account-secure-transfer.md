# Set-AzStorageAccountSecureTransfer

**Prüfstatus: Ungeprüft**

Aktiviert 'Secure Transfer Required' für einen Azure Storage Account.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Aus Sicherheitsgründen sollte für Storage Accounts immer "Secure Transfer Required" (HTTPS only) aktiviert sein.
    Dieses Skript setzt diese Einstellung für einen spezifischen Account.

    Parameter:
    - ResourceGroupName: Name der Ressourcengruppe
    - StorageAccountName: Name des Storage Accounts

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

Noch kein geprüftes Aufrufbeispiel dokumentiert. Parameter mit `Get-Help './01_Azure_Infrastructure/003_Set-AzStorageAccountSecureTransfer.ps1' -Full` lesen.

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/01_Azure_Infrastructure/003_Set-AzStorageAccountSecureTransfer.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
