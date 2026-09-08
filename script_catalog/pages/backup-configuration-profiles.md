# Backup-ConfigurationProfiles

**Prüfstatus: Ungeprüft**

Erstellt ein Backup (JSON Export) aller Konfigurationsprofile.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Exportiert die Definition jedes Profils als JSON-Datei in einen lokalen Ordner.
    Nützlich für Disaster Recovery oder Dokumentation.
    Erfordert die Berechtigung 'DeviceManagementConfiguration.Read.All'.

## Prüfung

Keine fachliche Freigabe aus der Katalogerstellung ableiten.

- static: aktueller erfolgreicher Nachweis fehlt
- pester: aktueller erfolgreicher Nachweis fehlt
- windows: aktueller erfolgreicher Nachweis fehlt
- tenant: aktueller erfolgreicher Nachweis fehlt

## Voraussetzungen

- Module: Microsoft.Graph.Authentication, Microsoft.Graph (passende SDK-Untermodule)
- Dokumentierte Graph-Scopes: DeviceManagementConfiguration.Read.All
- Hilfsdateien: Keine lokale Hilfsdatei erkannt.

## Verwendung

Noch kein geprüftes Aufrufbeispiel dokumentiert. Parameter mit `Get-Help './03_Compliance_Configuration/25_Backup-ConfigurationProfiles.ps1' -Full` lesen.

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/03_Compliance_Configuration/25_Backup-ConfigurationProfiles.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
