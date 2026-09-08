<#
.SYNOPSIS
    Ruft Intune Audit Logs ab.

.DESCRIPTION
    <!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Lädt die letzten Audit-Einträge (Wer hat was geändert?).
    Erfordert die Berechtigung 'DeviceManagementApps.Read.All' (audit logs falls accessible).
    Hinweis: Audit Logs benötigen oft spezielle Berechtigungen (AuditLog.Read.All).

.NOTES
    File Name: 51_Get-IntuneAuditLogs.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param()

Connect-MgGraph -Scopes "AuditLog.Read.All"

Get-MgAuditLogDirectoryAudit -Top 50 | Select-Object ActivityDateTime, ActivityDisplayName, InitiatedBy, TargetResources | Format-Table -AutoSize
