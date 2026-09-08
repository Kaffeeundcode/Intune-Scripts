# BulkCreate-Users

**Prüfstatus: Ungeprüft**

Erstellt mehrere Benutzer aus einer CSV-Datei.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Importiert Benutzerdaten (DisplayName, UPN, Password, etc.) aus einer CSV und legt die Accounts an.
    Erfordert die Berechtigung 'User.ReadWrite.All'.

## Prüfung

Keine fachliche Freigabe aus der Katalogerstellung ableiten.

- static: aktueller erfolgreicher Nachweis fehlt
- pester: aktueller erfolgreicher Nachweis fehlt
- windows: aktueller erfolgreicher Nachweis fehlt
- tenant: aktueller erfolgreicher Nachweis fehlt

## Voraussetzungen

- Module: Microsoft.Graph.Authentication, Microsoft.Graph (passende SDK-Untermodule)
- Dokumentierte Graph-Scopes: User.ReadWrite.All
- Hilfsdateien: Keine lokale Hilfsdatei erkannt.

## Verwendung

Noch kein geprüftes Aufrufbeispiel dokumentiert. Parameter mit `Get-Help './11_EntraID_UserManagement/102_BulkCreate-Users.ps1' -Full` lesen.

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/11_EntraID_UserManagement/102_BulkCreate-Users.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
