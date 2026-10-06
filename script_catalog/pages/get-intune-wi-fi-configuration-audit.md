# Get-IntuneWiFiConfigurationAudit

**Prüfstatus: Ungeprüft**

Prueft Wi-Fi-Konfigurationsobjekte in Intune.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Listet Wi-Fi-Richtlinien und markiert unzugeordnete Profile sowie solche ohne
    erkennbaren SSID-Bezug.

## Prüfung

Keine fachliche Freigabe aus der Katalogerstellung ableiten.

- static: aktueller erfolgreicher Nachweis fehlt
- pester: aktueller erfolgreicher Nachweis fehlt
- windows: aktueller erfolgreicher Nachweis fehlt
- tenant: aktueller erfolgreicher Nachweis fehlt

## Voraussetzungen

- Module: Microsoft.Graph.Authentication
- Dokumentierte Graph-Scopes: DeviceManagementConfiguration.Read.All
- Hilfsdateien: Keine lokale Hilfsdatei erkannt.

## Verwendung

```powershell
./24_Network_Readiness/396_Get-IntuneWiFiConfigurationAudit.ps1 -OutputPath './reports/wifi-audit.csv'
```

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/24_Network_Readiness/396_Get-IntuneWiFiConfigurationAudit.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
