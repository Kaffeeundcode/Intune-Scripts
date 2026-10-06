# Get-IntuneCustomComplianceTemplateGenerator

**Prüfstatus: Ungeprüft**

Erzeugt eine Intune-Custom-Compliance-Vorlage.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Erstellt aus SettingName, ExpectedValue und Operator eine JSON-Vorlage fuer
    Intune Custom Compliance. Der RemediationScriptPath ist optional und wird nur
    als Text referenziert.

## Prüfung

Keine fachliche Freigabe aus der Katalogerstellung ableiten.

- static: aktueller erfolgreicher Nachweis fehlt
- pester: aktueller erfolgreicher Nachweis fehlt
- windows: aktueller erfolgreicher Nachweis fehlt
- tenant: aktueller erfolgreicher Nachweis fehlt

## Voraussetzungen

- Module: Microsoft.Graph.Authentication
- Dokumentierte Graph-Scopes: Nicht angegeben; vor Tenant-Nutzung prüfen.
- Hilfsdateien: Keine lokale Hilfsdatei erkannt.

## Verwendung

```powershell
./21_Security_Deep_Dive/386_Get-IntuneCustomComplianceTemplateGenerator.ps1 -SettingName 'FirewallEnabled' -ExpectedValue 'true' -Operator 'isEqualTo' -OutputPath './compliance-rule.json'
```

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/21_Security_Deep_Dive/386_Get-IntuneCustomComplianceTemplateGenerator.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
