<#
.SYNOPSIS
    Lists recent Intune Audit Logs.
    
.DESCRIPTION
    Retrieves the last 50 audit events.
    Requires 'AuditLog.Read.All' permission.

.NOTES
    File Name: 51_Get-RecentAuditLogs.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param()

Connect-MgGraph -Scopes "AuditLog.Read.All"

$Logs = Get-MgAuditLogDirectoryAudit -Top 50 -Sort "activityDateTime desc" -Filter "activityDateTime ge $(Get-Date).AddDays(-7).ToString('yyyy-MM-ddTHH:mm:ssZ')"

if ($Logs) {
    # Custom Object for readability
    $Logs | ForEach-Object {
        [PSCustomObject]@{
            Time = $_.ActivityDateTime
            Activity = $_.ActivityDisplayName
            InitiatedBy = $_.InitiatedBy.User.UserPrincipalName
            Result = $_.Result
            Target = $_.TargetResources.DisplayName -join ", "
        }
    } | Format-Table -AutoSize
} else {
    Write-Host "No audit logs found in the last 7 days."
}
