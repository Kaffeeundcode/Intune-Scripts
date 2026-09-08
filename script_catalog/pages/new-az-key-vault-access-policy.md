# New-AzKeyVaultAccessPolicy

**Prüfstatus: Ungeprüft**

Fügt eine Access Policy zu einem Azure KeyVault hinzu.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Gewährt einem Benutzer oder Service Principal (SPN) Zugriff auf Secrets/Keys/Zertifikate in einem KeyVault.

    Parameter:
    - VaultName: Name des KeyVaults
    - ResourceGroupName: RG des KeyVaults
    - UserEmail: (Optional) E-Mail (UPN) eines Benutzers
    - ObjectId: (Optional) Object ID eines Benutzers/SPN/Gruppe
    - PermissionsToSecrets: Array von Rechten (z.B. Get, List, Set, Delete)

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

Noch kein geprüftes Aufrufbeispiel dokumentiert. Parameter mit `Get-Help './01_Azure_Infrastructure/007_New-AzKeyVaultAccessPolicy.ps1' -Full` lesen.

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/01_Azure_Infrastructure/007_New-AzKeyVaultAccessPolicy.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
