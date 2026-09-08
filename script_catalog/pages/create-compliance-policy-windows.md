# Create-CompliancePolicy_Windows

**Prüfstatus: Ungeprüft**

Erstellt eine Basis-Compliance-Richtlinie für Windows 10/11.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Legt eine neue Policy an, die z.B. BitLocker und Secure Boot erfordert.
    Dies ist ein Beispiel-Template.
    Erfordert die Berechtigung 'DeviceManagementConfiguration.ReadWrite.All'.

## Prüfung

Keine fachliche Freigabe aus der Katalogerstellung ableiten.

- static: aktueller erfolgreicher Nachweis fehlt
- pester: aktueller erfolgreicher Nachweis fehlt
- windows: aktueller erfolgreicher Nachweis fehlt
- tenant: aktueller erfolgreicher Nachweis fehlt

## Voraussetzungen

- Module: Microsoft.Graph.Authentication, Microsoft.Graph (passende SDK-Untermodule)
- Dokumentierte Graph-Scopes: DeviceManagementConfiguration.ReadWrite.All
- Hilfsdateien: Keine lokale Hilfsdatei erkannt.

## Verwendung

Noch kein geprüftes Aufrufbeispiel dokumentiert. Parameter mit `Get-Help './03_Compliance_Configuration/23_Create-CompliancePolicy_Windows.ps1' -Full` lesen.

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/03_Compliance_Configuration/23_Create-CompliancePolicy_Windows.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
