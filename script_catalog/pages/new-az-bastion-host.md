# New-AzBastionHost

**Prüfstatus: Ungeprüft**

Erstellt einen Azure Bastion Host für sicheren VM-Zugriff.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Azure Bastion ermöglicht RDP/SSH-Zugriff über SSL ohne Public IPs an den VMs.
    Dieses Skript erstellt den Bastion Host inkl. Public IP.
    Benötigt ein Subnetz namens 'AzureBastionSubnet' (min. /26).

    Parameter:
    - ResourceGroupName: RG Name
    - BastionName: Name des Bastion Service
    - VNetName: Name des Ziel-VNets
    - Location: Region

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

Noch kein geprüftes Aufrufbeispiel dokumentiert. Parameter mit `Get-Help './01_Azure_Infrastructure/016_New-AzBastionHost.ps1' -Full` lesen.

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/01_Azure_Infrastructure/016_New-AzBastionHost.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
