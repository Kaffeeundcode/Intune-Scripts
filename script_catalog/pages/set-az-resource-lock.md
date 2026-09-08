# Set-AzResourceLock

**Prüfstatus: Ungeprüft**

Setzt einen 'CanNotDelete'-Lock auf kritische Ressourcen, um versehentliches Löschen zu verhindern.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Resource Locks sind ein wichtiger Schutzmechanismus.
    Dieses Skript setzt einen Lock auf eine Ressourcengruppe oder eine spezifische Ressource.

    Parameter:
    - ResourceGroupName: RG Name
    - ResourceName: (Optional) Name der Ressource. Wenn leer, wird die ganze RG gesperrt.
    - ResourceType: (Optional) Typ der Ressource (z.B. Microsoft.Storage/storageAccounts) - Pflicht wenn ResourceName gesetzt.
    - LockName: Name des Locks (Default: 'Auto-Protection-Lock')

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

Noch kein geprüftes Aufrufbeispiel dokumentiert. Parameter mit `Get-Help './01_Azure_Infrastructure/014_Set-AzResourceLock.ps1' -Full` lesen.

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/01_Azure_Infrastructure/014_Set-AzResourceLock.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
