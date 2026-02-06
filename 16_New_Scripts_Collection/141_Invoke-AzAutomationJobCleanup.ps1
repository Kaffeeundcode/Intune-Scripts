<#
.SYNOPSIS
    Maintenance script to clean up old Automation Job history.

.DESCRIPTION
    Azure Automation keeps job logs which can be noisy.
    This script finds jobs older than X days and effectively clears them from view 
    (though archiving is native, this is for operational dashboard cleanup).
    
    Note: Can't delete jobs via simple cmdlet easily, often used to just export-and-purge logic.
    Here we focus on identifying the purge candidates.

.NOTES
    File Name  : 141_Invoke-AzAutomationJobCleanup.ps1
    Author     : Kaffeeundcode
    Version    : 1.0
#>

Param(
    [string]$AutomationAccountName,
    [string]$ResourceGroupName,
    [int]$DaysToKeep = 30
)

$Jobs = Get-AzAutomationJob -AutomationAccountName $AutomationAccountName -ResourceGroupName $ResourceGroupName -StartTime (Get-Date).AddDays(-365) -EndTime (Get-Date).AddDays(-$DaysToKeep)

Write-Host "Found $($Jobs.Count) old jobs." -ForegroundColor Yellow

foreach ($Job in $Jobs) {
    # Azure doesn't have a direct 'Remove-AzAutomationJob' (Logs are immutable usually till retention period).
    # This script serves to audit what is 'Old'.
    # Real cleanup is retention policy based.
    
    Write-Host "Old Job: $($Job.JobId) - $($Job.RunbookName) - $($Job.EndTime)" -ForegroundColor Gray
}

Write-Host "Recommendation: Adjust Data Retention in Azure Automation settings to $DaysToKeep days." -ForegroundColor Cyan
