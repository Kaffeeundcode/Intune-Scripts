<#
.SYNOPSIS
    Zeigt Fehlerberichte bei der Registrierung.
    
.DESCRIPTION
    Liest Enrollment-Fehler aus dem Monitoring-Bereich.
    Erfordert die Berechtigung 'DeviceManagementManagedDevices.Read.All'.

.NOTES
    File Name: 49_Get-EnrollmentFailures.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param()

Connect-MgGraph -Scopes "DeviceManagementManagedDevices.Read.All"

# Using Graph Report endpoint (rough example)
$Uri = "https://graph.microsoft.com/beta/deviceManagement/reports/getEnrollmentFailures"
# Needs POST with body logic usually. Placeholder logic:
Write-Warning "Für diesen Report wird das Reporting-Modul benötigt. Siehe Intune UI."
