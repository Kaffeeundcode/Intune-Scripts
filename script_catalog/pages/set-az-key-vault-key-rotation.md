# Set-AzKeyVaultKeyRotation

**Prüfstatus: Ungeprüft**

Konfiguriert automatisches Key-Rotation Policy Template für einen KeyVault Key.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Aktiviert Rotation (z.B. alle 90 Tage).
    Hinweis: Dies ist ein komplexes Feature, dieses Skript setzt eine Standard-Policy.
    Nur für Keys, nicht für Secrets!

    Parameter:
    - VaultName: KeyVault
    - KeyName: Name des Keys

## Prüfung

Keine fachliche Freigabe aus der Katalogerstellung ableiten.

- static: aktueller erfolgreicher Nachweis fehlt
- pester: aktueller erfolgreicher Nachweis fehlt
- windows: aktueller erfolgreicher Nachweis fehlt
- tenant: aktueller erfolgreicher Nachweis fehlt

## Voraussetzungen

- Module: Skript prüfen; keine Cloud-Module erkannt.
- Dokumentierte Graph-Scopes: Nicht angegeben; vor Tenant-Nutzung prüfen.
- Hilfsdateien: Keine lokale Hilfsdatei erkannt.

## Verwendung

Noch kein geprüftes Aufrufbeispiel dokumentiert. Parameter mit `Get-Help './05_Azure_Automation/089_Set-AzKeyVaultKeyRotation.ps1' -Full` lesen.

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/05_Azure_Automation/089_Set-AzKeyVaultKeyRotation.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
