# Test-IntuneAutopilotReadiness

**Prüfstatus: Ungeprüft**

Prueft Autopilot-Registrierung und Profilzuweisung fuer eine Seriennummer.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Liest Autopilot-Identity und zugeordnetes Deployment-Profil. Liefert konkrete Blocker sowie nicht pruefbare Voraussetzungen.
    TPM, Netzwerk, Benutzerlizenz und OOBE-Funktion benoetigen separate Geraete-/Tenant-Tests.

## Prüfung

Keine fachliche Freigabe aus der Katalogerstellung ableiten.

- static: aktueller erfolgreicher Nachweis fehlt
- pester: aktueller erfolgreicher Nachweis fehlt
- windows: aktueller erfolgreicher Nachweis fehlt
- tenant: aktueller erfolgreicher Nachweis fehlt

## Voraussetzungen

- Module: Microsoft.Graph.Authentication
- Dokumentierte Graph-Scopes: DeviceManagementServiceConfig.Read.All
- Hilfsdateien: Keine lokale Hilfsdatei erkannt.

## Verwendung

```powershell
./17_Intune_Workflows/359_Test-IntuneAutopilotReadiness.ps1 -SerialNumber 'TEST-SERIAL'
```

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/17_Intune_Workflows/359_Test-IntuneAutopilotReadiness.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
