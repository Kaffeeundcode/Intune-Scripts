# Assign-AutopilotProfile

**Prüfstatus: Bekannte Fehler**

Weist einem Autopilot-Gerät ein Deployment-Profil zu.

<!-- library-status:start -->
    Prüfstatus: Bekannte Fehler
    Setzt Statusfelder statt einer gruppenbasierten Profilzuweisung; nicht ausfuehren.

    <!-- library-status:end -->

    Verknüpft ein Autopilot-Gerät (via ID) mit einem spezifischen Profil.
    Erfordert die Berechtigung 'DeviceManagementServiceConfig.ReadWrite.All'.

## Prüfung

- Setzt Statusfelder statt einer gruppenbasierten Profilzuweisung; nicht ausfuehren.

- static: aktueller erfolgreicher Nachweis fehlt
- pester: aktueller erfolgreicher Nachweis fehlt
- windows: aktueller erfolgreicher Nachweis fehlt
- tenant: aktueller erfolgreicher Nachweis fehlt

## Voraussetzungen

- Module: Microsoft.Graph.Authentication, Microsoft.Graph (passende SDK-Untermodule)
- Dokumentierte Graph-Scopes: DeviceManagementServiceConfig.ReadWrite.All
- Hilfsdateien: Keine lokale Hilfsdatei erkannt.

## Verwendung

Noch kein geprüftes Aufrufbeispiel dokumentiert. Parameter mit `Get-Help './05_Enrollment_Autopilot/43_Assign-AutopilotProfile.ps1' -Full` lesen.

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/05_Enrollment_Autopilot/43_Assign-AutopilotProfile.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
