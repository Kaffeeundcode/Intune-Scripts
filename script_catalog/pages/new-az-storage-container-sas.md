# New-AzStorageContainerSAS

**Prüfstatus: Ungeprüft**

Erstellt ein SAS-Token (Shared Access Signature) für einen Storage Container.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    SAS-Tokens ermöglichen zeitbegrenzten Zugriff auf Storage-Ressourcen ohne Key-Weitergabe.
    Dieses Skript generiert ein Token für einen spezifischen Container.

    Parameter:
    - ResourceGroupName: RG Name
    - StorageAccountName: Storage Name
    - ContainerName: Container Name
    - ValidityHours: Gültigkeitsdauer in Stunden (Default: 24)
    - Permission: Rechte (r=Read, w=Write, d=Delete, l=List) (Default: 'rl')

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

Noch kein geprüftes Aufrufbeispiel dokumentiert. Parameter mit `Get-Help './01_Azure_Infrastructure/012_New-AzStorageContainerSAS.ps1' -Full` lesen.

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/01_Azure_Infrastructure/012_New-AzStorageContainerSAS.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
