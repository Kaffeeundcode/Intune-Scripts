# Get-EntraIDMFAAuthenticationMethodUsage

**Prüfstatus: Ungeprüft**

Reports on the distribution of MFA methods registered by users.

<!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Analyzes which authentication methods users have registered (Microsoft Authenticator, SMS, Phone, FIDO2).
    Helpful for driving migration from SMS to Authenticator App.

## Prüfung

Keine fachliche Freigabe aus der Katalogerstellung ableiten.

- static: aktueller erfolgreicher Nachweis fehlt
- pester: aktueller erfolgreicher Nachweis fehlt
- windows: aktueller erfolgreicher Nachweis fehlt
- tenant: aktueller erfolgreicher Nachweis fehlt

## Voraussetzungen

- Module: Microsoft.Graph.Authentication, Microsoft.Graph (passende SDK-Untermodule)
- Dokumentierte Graph-Scopes: UserAuthenticationMethod.Read.All, User.Read.All
- Hilfsdateien: Keine lokale Hilfsdatei erkannt.

## Verwendung

Noch kein geprüftes Aufrufbeispiel dokumentiert. Parameter mit `Get-Help './16_Mixed_New_Scripts/114_Get-EntraIDMFAAuthenticationMethodUsage.ps1' -Full` lesen.

## Quelle

[PowerShell-Datei auf GitHub](https://github.com/Kaffeeundcode/Intune-Scripts/blob/main/16_Mixed_New_Scripts/114_Get-EntraIDMFAAuthenticationMethodUsage.ps1)

Prüfungen gelten nur für den dokumentierten Quellstand und Testumfang.
