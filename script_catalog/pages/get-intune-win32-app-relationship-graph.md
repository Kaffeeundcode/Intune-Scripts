# Get-IntuneWin32AppRelationshipGraph

**Prüfstatus: Ungeprüft**

Liefert Abhaengigkeiten und Abloesungsbeziehungen von Win32-Apps.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Liest die Graph-beta-Relationships aller Win32-Apps. Jeder fehlgeschlagene Abruf wird gesondert ausgegeben.
    SourceId und TargetId bleiben erhalten; RelationshipType unterscheidet Dependency und Supersedence.

## Prüfung

Keine fachliche Freigabe aus der Katalogerstellung ableiten.

- static: aktueller erfolgreicher Nachweis fehlt
- pester: aktueller erfolgreicher Nachweis fehlt
- windows: aktueller erfolgreicher Nachweis fehlt
- tenant: aktueller erfolgreicher Nachweis fehlt

## Voraussetzungen

- Module: Microsoft.Graph.Authentication
- Dokumentierte Graph-Scopes: DeviceManagementApps.Read.All
- Hilfsdateien: Keine lokale Hilfsdatei erkannt.

## Verwendung

```powershell
./17_Intune_Workflows/357_Get-IntuneWin32AppRelationshipGraph.ps1 -OutputPath './reports/app-relationships.json'
```

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/17_Intune_Workflows/357_Get-IntuneWin32AppRelationshipGraph.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
