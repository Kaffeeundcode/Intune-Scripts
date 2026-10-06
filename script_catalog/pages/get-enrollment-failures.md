# Get-EnrollmentFailures

**Prüfstatus: Ungeprüft**

Exportiert aktuelle Intune-Registrierungsfehler.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Liest den offiziellen Intune-Report DeviceEnrollmentFailures ueber die asynchrone
    ExportJobs-Schnittstelle. Fehler werden nach Zeitraum gefiltert und mit Methode,
    Betriebssystem, Benutzer und gemeldetem Grund ausgegeben. Ein unlesbarer Zeitstempel
    wird als Nicht pruefbar ausgegeben und nicht stillschweigend verworfen.

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
./05_Enrollment_Autopilot/49_Get-EnrollmentFailures.ps1 -Days 14 -OutputPath './reports/enrollment-failures.csv'
```

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/05_Enrollment_Autopilot/49_Get-EnrollmentFailures.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
