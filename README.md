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
*   **Scripts_To_Upload (Neu)**: Eine Sammlung von 50 neuen Skripten, die diverse Themen abdecken (Azure, EntraID, Intune, Teams). Details siehe unten.
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

## Neue Skripte (Scripts_To_Upload)
Hier ist eine Übersicht der 50 neu hinzugefügten Skripte:

| Script Name | Description |
| :--- | :--- |
| **101_Get-IntuneCoManagementEligibility.ps1** | Analyzes devices to determine their eligibility for Co-Management (Intune + ConfigMgr). |
| **102_Get-IntunePolicyPerSettingStatus.ps1** | Exports detailed status for every setting within a specific Intune Configuration Profile. |
| **103_Get-IntuneDeviceHardwareHashBulk.ps1** | Retrieves Hardware Hashes for Windows Autopilot from existing Intune devices. |
| **104_Get-IntuneAppRevisionHistory.ps1** | Tracks version history and revision changes for Intune Apps (Win32). |
| **105_Get-IntuneAssignmentFiltersUsage.ps1** | Maps Assignment Filters to the Applications and Policies that use them. |
| **106_Get-IntuneDeviceStalenessScore.ps1** | Calculates a "Staleness Score" for devices to help identify candidates for cleanup. |
| **107_Get-IntuneScopeTagInventory.ps1** | Audits the usage of Scope Tags across Intune objects. |
| **108_Get-IntuneEnrollmentTokenStatus.ps1** | Checks the status and expiration of Enrollment Tokens (DEM, Apple VPP, DEP, Android). |
| **109_Get-IntuneDeviceRestorePoints.ps1** | Lists Restore Points for Cloud PCs (Windows 365). |
| **110_Get-IntuneMAMPolicyDeployment.ps1** | Reports on Mobile Application Management (MAM) Policy deployments (App Protection). |
| **111_Get-EntraIDShadowITApps.ps1** | Identifies "Shadow IT" applications where users have consented to high-privilege scopes. |
| **112_Get-EntraIDGuestUserSponsors.ps1** | Identifies the "Sponsor" or inviter of Guest Users in Entra ID. |
| **113_Remove-EntraIDExpiredGroupLifecycle.ps1** | Simulates or enforces cleanup of M365 Groups based on custom criteria (pseudo-Lifecycle Policy). |
| **114_Get-EntraIDMFAAuthenticationMethodUsage.ps1** | Reports on the distribution of MFA methods registered by users. |
| **115_Get-EntraIDStaleServicePrincipals.ps1** | Identifies Service Principals (Enterprise Apps) that have not signed in recently. |
| **116_Get-EntraIDAdministrativeUnitMembership.ps1** | Reports on Administrative Unit (AU) membership and their assigned roles. |
| **117_Get-EntraIDConditionalAccessGaps.ps1** | Identifies users who are NOT covered by specific critical Conditional Access policies. |
| **118_Set-EntraIDUserLocationFromIP.ps1** | Suggests Usage Location updates for users based on their recent successful sign-in IP. |
| **119_Get-EntraIDDirectoryRoleTemplates.ps1** | Lists all available Directory Rules and Templates (Built-in Roles). |
| **120_Get-EntraIDApplicationOwnerAudit.ps1** | Audit Applications (App Registrations) to find those with no owners or disabled owners. |
| **121_Get-AzVMHybridUseBenefitCandidate.ps1** | Identifies Windows VMs that are NOT using the Azure Hybrid Benefit (AHB). |
| **122_Get-AzStorageAccountLifecyclePolicy.ps1** | Audits Storage Accounts to check if they have a Lifecycle Management Policy. |
| **123_Get-AzNetworkOrphanedNSGs.ps1** | Identifies Network Security Groups (NSGs) that are not associated with any Subnet or Network Interface. |
| **124_Get-AzKeyVaultSecretVersionHistory.ps1** | Audits the number of past versions for Key Vault Secrets. |
| **125_Get-AzResourceChangeHistory.ps1** | Summarizes "Who changed what" in the last 24 hours via Activity Log. |
| **126_Get-AzAppServicePlanDensity.ps1** | Calculates the density of App Services running per App Service Plan. |
| **127_Get-AzVMPublicIPInsecurePorts.ps1** | Scans VMs with Public IPs for open management ports (RDP/SSH) to the internet. |
| **128_Get-AzSubscriptionPolicyExemptions.ps1** | Lists all Azure Policy Exemptions in the subscription. |
| **129_Get-AzRecoveryServicesVaultStorage.ps1** | Reports the storage usage of Recovery Services Vaults (Backups). |
| **130_Get-AzLoadBalancerEmptyPools.ps1** | Identifies Load Balancers that have no backend pool members defined. |
| **131_Get-TeamsOrphanedTeams.ps1** | Identifies Microsoft Teams that have no owners. |
| **132_Get-ExoMailboxDelegationReport.ps1** | Exports a comprehensive report of Mailbox Delegations (Full Access, Send As). |
| **133_Set-TeamsPrivateChannelLifecycle.ps1** | Archives or alerts on Teams Private Channels with no recent activity. |
| **134_Get-ExoMailFlowTransportRuleHits.ps1** | Exports Transport Rules and (where possible) analyzes if they are active. |
| **135_Get-M365GroupStorageTrend.ps1** | Reports on the SharePoint storage usage for M365 Groups (Teams/Groups). |
| **136_Get-TeamsAppPermissionGrants.ps1** | Audits 3rd party apps installed in Teams and their permissions. |
| **137_Get-ExoRoomMailboxEfficiency.ps1** | Analyzes Room Mailbox usage and decline rates (Capacity Planning). |
| **138_Set-M365UserLicenseReclaim.ps1** | Identifies disabled users who still hold a license and offers to reclaim them. |
| **139_Get-ExoPhishingSimulationStats.ps1** | Retrieves statistics from Attack Simulation Training (Phishing usage). |
| **140_Get-TeamsDeviceHealthDetailed.ps1** | Deep dive into Teams Devices (Rooms, Panels, Phones) health. |
| **141_Invoke-AzAutomationJobCleanup.ps1** | Maintenance script to clean up old Automation Job history. |
| **142_Get-ScriptExecutionTelemetry.ps1** | Parses local Intune Management Extension logs to analyze script execution times. |
| **143_New-ScheduledTaskMaintenance.ps1** | Creates a local Windows Scheduled Task to run weekly maintenance (Cleanup). |
| **144_Get-SystemUptimeReportBulk.ps1** | Queries a list of remote computers (WMI/CIM) for their uptime. |
| **145_Get-LocalUserProfileSize.ps1** | Calculates the size of User Profiles on the local machine. |
| **146_Remove-OldLogFiles.ps1** | Rotates or deletes old log files in a specific directory. |
| **147_Get-DriverVersionInventory.ps1** | Exports driver versions for specific hardware components (e.g., Display, Net). |
| **148_Set-PowerPlanHighPerformance.ps1** | Enforces 'High Performance' power plan when connected to AC power. |
| **149_Get-InstalledSoftwareFuzzy.ps1** | Searches installed software (Registry) using fuzzy matching/wildcards. |
| **150_Repair-WMIHealth.ps1** | Basic check and repair for WMI consistency. |

## Autor
**Mattia Cirillo**
*   [Webseite / kaffeeundcode](https://kaffeeundcode.com)
*   Entwickelt mit ❤️ für Intune-Admins.
