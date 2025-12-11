<#
.SYNOPSIS
    Exports Intune Audit Logs to CSV.
    
.DESCRIPTION
    Requires 'AuditLog.Read.All' permission.

.NOTES
    File Name: 55_Export-AuditLogs.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param(
    [string]$Path = ".\AuditLogExport.csv"
)

Connect-MgGraph -Scopes "AuditLog.Read.All"

$Logs = Get-MgAuditLogDirectoryAudit -Top 500 -Filter "activityDateTime ge $(Get-Date).AddDays(-30).ToString('yyyy-MM-ddTHH:mm:ssZ')"

if ($Logs) {
    $Logs | Select-Object ActivityDateTime, ActivityDisplayName, Result, @{N='User';E={$_.InitiatedBy.User.UserPrincipalName}}, @{N='Resource';E={$_.TargetResources.DisplayName -join ";"}} | Export-Csv -Path $Path -NoTypeInformation
    Write-Host "Exported logs to $Path" -ForegroundColor Green
}
