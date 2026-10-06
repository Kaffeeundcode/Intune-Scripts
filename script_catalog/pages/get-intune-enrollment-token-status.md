# Get-IntuneEnrollmentTokenStatus

**Prüfstatus: Ungeprüft**

Prueft Apple- und Android-Onboardingdienste in Intune.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Erstellt einen gemeinsamen Status fuer APNs-Zertifikat, Apple-VPP-Tokens,
    Apple-ADE/DEP-Enrollment-Tokens und die Managed-Google-Play-Bindung.
    Android Enterprise besitzt kein vergleichbares Ablaufdatum; dort werden Bindungs-
    und Synchronisierungsstatus ausgewertet. Fehlgeschlagene Datenquellen erscheinen
    als Nicht pruefbar.

## Prüfung

Keine fachliche Freigabe aus der Katalogerstellung ableiten.

- static: aktueller erfolgreicher Nachweis fehlt
- pester: aktueller erfolgreicher Nachweis fehlt
- windows: aktueller erfolgreicher Nachweis fehlt
- tenant: aktueller erfolgreicher Nachweis fehlt

## Voraussetzungen

- Module: Microsoft.Graph.Authentication
- Dokumentierte Graph-Scopes: DeviceManagementServiceConfig.Read.All, DeviceManagementApps.Read.All
- Hilfsdateien: Keine lokale Hilfsdatei erkannt.

## Verwendung

```powershell
./16_Mixed_New_Scripts/108_Get-IntuneEnrollmentTokenStatus.ps1 -WarningDays 45 -OutputPath './reports/enrollment-services.json'
```

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/16_Mixed_New_Scripts/108_Get-IntuneEnrollmentTokenStatus.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
