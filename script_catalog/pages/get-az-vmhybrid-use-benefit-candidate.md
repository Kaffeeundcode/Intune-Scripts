# Get-AzVMHybridUseBenefitCandidate

**Prüfstatus: Ungeprüft**

Identifies Windows VMs that are NOT using the Azure Hybrid Benefit (AHB).

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Running Windows Server in Azure is cheaper if you bring your own license (AHB).
    This script finds VMs with 'Windows' OS where LicenseType is null or not 'Windows_Server',
    indicating potential cost savings.

## Prüfung

Keine fachliche Freigabe aus der Katalogerstellung ableiten.

- static: aktueller erfolgreicher Nachweis fehlt
- pester: aktueller erfolgreicher Nachweis fehlt
- windows: aktueller erfolgreicher Nachweis fehlt
- tenant: aktueller erfolgreicher Nachweis fehlt

## Voraussetzungen

- Module: Az
- Dokumentierte Graph-Scopes: Nicht angegeben; vor Tenant-Nutzung prüfen.
- Hilfsdateien: Keine lokale Hilfsdatei erkannt.

## Verwendung

Noch kein geprüftes Aufrufbeispiel dokumentiert. Parameter mit `Get-Help './16_Mixed_New_Scripts/121_Get-AzVMHybridUseBenefitCandidate.ps1' -Full` lesen.

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/16_Mixed_New_Scripts/121_Get-AzVMHybridUseBenefitCandidate.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
