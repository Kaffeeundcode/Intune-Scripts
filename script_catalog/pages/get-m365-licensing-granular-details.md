# Get-M365LicensingGranularDetails

**Prüfstatus: Ungeprüft**

Zeigt detaillierte Lizenzinformationen (welche Service Pläne sind aktiv) für einen User.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Eine "E5" Lizenz hat viele Unterkomponenten (Intune, Exchange, Teams...).
    Dieses Skript zeigt genau, welche Dienste für einen User AKTIViert sind.

    Parameter:
    - UserPrincipalName: Der Benutzer.

## Prüfung

Keine fachliche Freigabe aus der Katalogerstellung ableiten.

- static: aktueller erfolgreicher Nachweis fehlt
- pester: aktueller erfolgreicher Nachweis fehlt
- windows: aktueller erfolgreicher Nachweis fehlt
- tenant: aktueller erfolgreicher Nachweis fehlt

## Voraussetzungen

- Module: Microsoft.Graph.Authentication, Microsoft.Graph (passende SDK-Untermodule)
- Dokumentierte Graph-Scopes: Nicht angegeben; vor Tenant-Nutzung prüfen.
- Hilfsdateien: Keine lokale Hilfsdatei erkannt.

## Verwendung

Noch kein geprüftes Aufrufbeispiel dokumentiert. Parameter mit `Get-Help './04_M365_Exchange/067_Get-M365LicensingGranularDetails.ps1' -Full` lesen.

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/04_M365_Exchange/067_Get-M365LicensingGranularDetails.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
