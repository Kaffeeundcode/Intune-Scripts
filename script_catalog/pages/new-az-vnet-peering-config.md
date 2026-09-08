# New-AzVNetPeeringConfig

**Prüfstatus: Ungeprüft**

Erstellt ein VNet-Peering zwischen zwei virtuellen Netzwerken in Azure.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Dieses Skript verbindet zwei VNets (Source und Destination) über ein Peering.
    Es prüft, ob die VNets existieren und führt das Peering in BEIDE Richtungen aus (Bidirektional),
    da ein Peering immer zweiseitig konfiguriert werden muss, um zu funktionieren.

    Parameter:
    - SourceResourceGroup: RG des ersten VNets
    - SourceVNetName: Name des ersten VNets
    - DestResourceGroup: RG des zweiten VNets
    - DestVNetName: Name des zweiten VNets

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

Noch kein geprüftes Aufrufbeispiel dokumentiert. Parameter mit `Get-Help './01_Azure_Infrastructure/002_New-AzVNetPeeringConfig.ps1' -Full` lesen.

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/01_Azure_Infrastructure/002_New-AzVNetPeeringConfig.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
