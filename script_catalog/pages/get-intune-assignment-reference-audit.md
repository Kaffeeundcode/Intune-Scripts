# Get-IntuneAssignmentReferenceAudit

**Prüfstatus: Ungeprüft**

Prueft ob Zielgruppenobjekte noch existieren.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Listet Zuweisungen, deren Ziel-Objekte nicht mehr gefunden werden koennen. Das Skript
    identifiziert verwaiste Referenzen in Richtlinienzuweisungen.

## Prüfung

Keine fachliche Freigabe aus der Katalogerstellung ableiten.

- static: aktueller erfolgreicher Nachweis fehlt
- pester: aktueller erfolgreicher Nachweis fehlt
- windows: aktueller erfolgreicher Nachweis fehlt
- tenant: aktueller erfolgreicher Nachweis fehlt

## Voraussetzungen

- Module: Microsoft.Graph.Authentication
- Dokumentierte Graph-Scopes: DeviceManagementConfiguration.Read.All, Group.Read.All
- Hilfsdateien: Keine lokale Hilfsdatei erkannt.

## Verwendung

```powershell
./28_Intune_Data_Quality/414_Get-IntuneAssignmentReferenceAudit.ps1 -OutputPath './reports/assignment-reference-gaps.csv'
```

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/28_Intune_Data_Quality/414_Get-IntuneAssignmentReferenceAudit.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
