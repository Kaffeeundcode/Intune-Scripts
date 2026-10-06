# Katalog- und Prüfbericht

- Skripteinträge: 597
- Unterschiedliche Implementierungen laut Manifest: 576
- Erste Auswahl: 100
- Weitere Bestandskandidaten: 100
- Geprüft: 0
- Beispiele: 9
- Bekannte Fehler: 9

Die Katalogprüfung validiert Pfade, Auswahlquoten, eindeutige Seiten und Nachweise. Sie beweist keine Windows- oder Tenant-Funktion.

## Bekannte Fehler und Beispiele

- 03_Compliance_Configuration/30_Duplicate-CompliancePolicy.ps1: Enthaelt Beispiel-/Platzhalterlogik; kein abgeschlossener Betriebsablauf.
- 03_Intune_Remediations/050_Remediate-PendingReboot.ps1: Enthaelt Beispiel-/Platzhalterlogik; kein abgeschlossener Betriebsablauf.
- 03_Intune_Remediations/052_Remediate-UpdateApp.ps1: Enthaelt Beispiel-/Platzhalterlogik; kein abgeschlossener Betriebsablauf.
- 05_Enrollment_Autopilot/42_Import-AutopilotCSV.ps1: Enthaelt Beispiel-/Platzhalterlogik; kein abgeschlossener Betriebsablauf.
- 05_Enrollment_Autopilot/43_Assign-AutopilotProfile.ps1: Setzt Statusfelder statt einer gruppenbasierten Profilzuweisung; nicht ausfuehren.
- 07_Security_BitLocker/68_Assign-SecurityBaseline.ps1: Enthaelt Beispiel-/Platzhalterlogik; kein abgeschlossener Betriebsablauf.
- 07_Security_BitLocker/70_Check-DeviceSecurityScore.ps1: Enthaelt Beispiel-/Platzhalterlogik; kein abgeschlossener Betriebsablauf.
- 14_EntraID_Security_CA/134_Create-Emergency-Account.ps1: Enthaelt Beispiel-/Platzhalterlogik; kein abgeschlossener Betriebsablauf.
- 15_Intune_Advanced_Enrollment/142_Create-EnrollmentProfile-iOS.ps1: Enthaelt Beispiel-/Platzhalterlogik; kein abgeschlossener Betriebsablauf.
- 15_Intune_Advanced_Enrollment/143_Create-EnrollmentProfile-Android.ps1: Enthaelt Beispiel-/Platzhalterlogik; kein abgeschlossener Betriebsablauf.
- 16_Teams_Telephony/264_Find-TeamsVoiceRoutingPoliciesWithoutRoutes.ps1: Prueft PSTN-Usages, loest aber keine zugeordneten Routen auf.
- 16_Teams_Telephony/290_Find-TeamsDialPlansWithoutPstnUsage.ps1: PSTN-Usage-Zuordnung gehoert zur Voice-Routing-Konfiguration.
- 16_Teams_Telephony/300_Find-TeamsLisLocationsWithoutNetworkMapping.ps1: Netzwerkzuordnung wird nicht gegen LIS-Netzwerkobjekte aufgeloest.
- 16_Teams_Telephony/332_Find-TeamsLicensedUsersWithoutTelephonyConfig.ps1: Lizenzpruefung fehlt; Ergebnis belegt keine Teams-Phone-Lizenz.
- 16_Teams_Telephony/334_Find-TeamsVoiceEnabledUsersWithoutDialPlan.ps1: Globale/geerbte effektive Richtlinien werden nicht vollstaendig aufgeloest.
- 16_Teams_Telephony/335_Find-TeamsVoiceEnabledUsersWithoutVoiceRoutingPolicy.ps1: Globale/geerbte effektive Richtlinien werden nicht vollstaendig aufgeloest.
- 16_Teams_Telephony/336_Find-TeamsVoiceEnabledUsersWithoutCallingPolicy.ps1: Globale/geerbte effektive Richtlinien werden nicht vollstaendig aufgeloest.
- 16_Teams_Telephony/337_Find-TeamsVoiceEnabledUsersWithoutEmergencyPolicy.ps1: Globale/geerbte effektive Richtlinien werden nicht vollstaendig aufgeloest.
