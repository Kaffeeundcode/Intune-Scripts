# Intune PowerShell Library
Dieses Repository enthält eine umfassende Sammlung von PowerShell-Skripten für die Verwaltung und Automatisierung von Microsoft Intune. Die Skripte interagieren hauptsächlich mit der Microsoft Graph API, um Aufgaben zu erledigen, die über das UI gar nicht oder nur umständlich möglich sind.
## Struktur
Das Repository ist in thematische Ordner unterteilt:
*   **01_Device_Management**: Skripte für Geräteaktionen (Sync, Restart, Wipe, Retire, Delete) und Abruf von Gerätedetails.
*   **02_App_Management**: Verwaltung von Applikationen, Zuweisungen und Installationsstatus.
*   **03_Compliance_Configuration**: Management von Compliance-Policies und Konfigurationsprofilen.
*   **04_Users_Groups**: Verwaltung von Benutzern und Gruppen in Bezug auf Intune-Zuweisungen.
*   **05_Enrollment_Autopilot**: Skripte rund um Windows Autopilot und Enrollment-Profile (z.B. Import von Hashes).
*   **06_Monitoring_Reporting**: Generierung von Berichten und Überwachung des Tenant-Status.
*   **07_Security_BitLocker**: Spezifische Skripte für BitLocker-Keys, Security Baselines und Verschlüsselung.
*   **08_Troubleshooting_Cleanup**: Bereinigung und Fehlerbehebung (z.B. alte Geräte entfernen).
*   **09_Graph_API_Advanced**: Erweiterte Interaktionen direkt mit der Graph API.
*   **10_Utility_Misc**: Nützliche Hilfsskripte und Tools.
## Voraussetzungen
Um diese Skripte auszuführen, müssen folgende Voraussetzungen erfüllt sein:
1.  **Microsoft Graph PowerShell SDK**:
    ```powershell
    Install-Module Microsoft.Graph -Scope CurrentUser
    ```
2.  **Verbindung herstellen**:
    Die meisten Skripte benötigen eine aktive Session. Starten Sie diese mit:
    ```powershell
    Connect-MgGraph -Scopes "DeviceManagementManagedDevices.ReadWrite.All", "DeviceManagementApps.ReadWrite.All", "User.Read.All"
    ```
    (Passen Sie die Scopes je nach benötigter Berechtigung an).
## Verwendung
Navigieren Sie in den entsprechenden Ordner und führen Sie das gewünschte Skript aus.
Beispiel (Gerät synchronisieren):
```powershell
./01_Device_Management/01_Sync-IntuneDevice.ps1 -DeviceName "DESKTOP-XYZ123"
```
## Hinweis
Bitte testen Sie Skripte ('besonders solche mit Löschfunktionen wie Wipe oder Delete') immer zuerst in einer Testumgebung oder mit einem einzelnen Testgerät.
## FAQ
**Q: Ich bekomme einen Fehler "Execution of scripts is disabled on this system".**
A: Die PowerShell Execution Policy muss angepasst werden. Führen Sie folgendes aus:
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```
**Q: Welche Module werden benötigt?**
A: Die Skripte basieren auf dem `Microsoft.Graph` Modul. Stellen Sie sicher, dass es installiert ist: `Install-Module Microsoft.Graph`.
**Q: Wie melde ich mich an?**
A: Nutzen Sie `Connect-MgGraph`. Beim ersten Mal müssen Sie im Browser-Fenster zustimmen (Consent).
## Autor
**Mattia Cirillo**
*   [Webseite / kaffeeundcode](https://kaffeeundcode.com)
*   Entwickelt mit ❤️ für Intune-Admins.
