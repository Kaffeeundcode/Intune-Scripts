# Get-IntuneProvisioningStateReport

**Prüfstatus: Ungeprüft**

Analysiert Bereitstellungs- und Registrierungszustaende.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Listet Geraete mit Provisioning- und Registrierungszustand. Ziel ist die Erkennung
    von unvollstaendigen oder fehlgeschlagenen Bereitstellungen.

## Prüfung

Keine fachliche Freigabe aus der Katalogerstellung ableiten.

- static: aktueller erfolgreicher Nachweis fehlt
- pester: aktueller erfolgreicher Nachweis fehlt
- windows: aktueller erfolgreicher Nachweis fehlt
- tenant: aktueller erfolgreicher Nachweis fehlt

## Voraussetzungen

- Module: Microsoft.Graph.Authentication
- Dokumentierte Graph-Scopes: DeviceManagementManagedDevices.Read.All
- Hilfsdateien: Keine lokale Hilfsdatei erkannt.

## Verwendung

```powershell
./26_Lifecycle_Gaps/406_Get-IntuneProvisioningStateReport.ps1 -OutputPath './reports/provisioning-states.csv'
```

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/26_Lifecycle_Gaps/406_Get-IntuneProvisioningStateReport.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
