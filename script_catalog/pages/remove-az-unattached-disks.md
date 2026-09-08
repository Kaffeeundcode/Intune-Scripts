# Remove-AzUnattachedDisks

**Prüfstatus: Ungeprüft**

Findet und löscht (optional) Managed Disks, die an keine VM angehängt sind (verwaiste Disks).

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Nicht angehängte Disks verursachen Speicherkosten. Dieses Skript listet alle 'Unattached' Disks in einer Subscription auf.
    Mit dem Switch '-Delete' werden diese gelöscht. VORSICHT!

    Parameter:
    - Delete: Wenn gesetzt, werden die Disks gelöscht. Ohne diesen Parameter ist es nur ein Report (WhatIf).

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

Noch kein geprüftes Aufrufbeispiel dokumentiert. Parameter mit `Get-Help './01_Azure_Infrastructure/005_Remove-AzUnattachedDisks.ps1' -Full` lesen.

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/01_Azure_Infrastructure/005_Remove-AzUnattachedDisks.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
