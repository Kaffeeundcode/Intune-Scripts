# Get-IntuneDeviceCertificateExpiryReport

**Prüfstatus: Ungeprüft**

Meldet abgelaufene und bald ablaufende Intune-Geraetezertifikate.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Verwendet den offiziellen Report AllDeviceCertificates und bewertet Ablaufdatum
    sowie gemeldeten Zertifikatstatus. Die Ausgabe enthaelt Richtlinie, Geraet,
    Benutzer, Aussteller und Thumbprint. Zertifikatinhalte oder private Schluessel
    werden nicht abgerufen.

## Prüfung

Keine fachliche Freigabe aus der Katalogerstellung ableiten.

- static: aktueller erfolgreicher Nachweis fehlt
- pester: aktueller erfolgreicher Nachweis fehlt
- windows: aktueller erfolgreicher Nachweis fehlt
- tenant: aktueller erfolgreicher Nachweis fehlt

## Voraussetzungen

- Module: Microsoft.Graph.Authentication
- Dokumentierte Graph-Scopes: DeviceManagementManagedDevices.Read.All, DeviceManagementConfiguration.Read.All
- Hilfsdateien: Keine lokale Hilfsdatei erkannt.

## Verwendung

```powershell
./17_Intune_Workflows/365_Get-IntuneDeviceCertificateExpiryReport.ps1 -WarningDays 45 -OutputPath './reports/certificate-expiry.csv'
```

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/17_Intune_Workflows/365_Get-IntuneDeviceCertificateExpiryReport.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
