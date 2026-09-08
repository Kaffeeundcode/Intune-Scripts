# Get-AzVMPublicIPInsecurePorts

**Prüfstatus: Ungeprüft**

Scans VMs with Public IPs for open management ports (RDP/SSH) to the internet.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Iterates all VMs with Public IPs.
    Checks the effective Network Security Group (NSG) rules.
    Flags if port 3389 (RDP) or 22 (SSH) allows access from 'Any' or 'Internet'.

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

Noch kein geprüftes Aufrufbeispiel dokumentiert. Parameter mit `Get-Help './16_Mixed_New_Scripts/127_Get-AzVMPublicIPInsecurePorts.ps1' -Full` lesen.

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/16_Mixed_New_Scripts/127_Get-AzVMPublicIPInsecurePorts.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
