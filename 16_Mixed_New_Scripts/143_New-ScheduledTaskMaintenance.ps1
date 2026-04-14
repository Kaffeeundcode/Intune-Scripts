<#
.SYNOPSIS
    Creates a local Windows Scheduled Task to run weekly maintenance (Cleanup).

.DESCRIPTION
    Useful for deploying via Intune as a "Script" to ensure clients self-maintain.
    Task Actions:
    - Clear Temp
    - Windows Update Cleanup (Dism)
    
    Runs as SYSTEM.

.NOTES
    File Name  : 143_New-ScheduledTaskMaintenance.ps1
    Author     : Kaffeeundcode
    Version    : 1.0
#>

$TaskName = "KaffeeCode_WeeklyMaintenance"

# Check existence
if (Get-ScheduledTask -TaskName $TaskName -ErrorAction SilentlyContinue) {
    Write-Host "Task already exists."
    exit 0
}

# Action
$ScriptBlock = {
    Remove-Item "C:\Windows\Temp\*" -Recurse -Force -ErrorAction SilentlyContinue
    Remove-Item "$env:TEMP\*" -Recurse -Force -ErrorAction SilentlyContinue
    # Clear-WindowsUpdate
    # Dism /Online /Cleanup-Image /StartComponentCleanup
}
$Encoded = [Convert]::ToBase64String([Text.Encoding]::Unicode.GetBytes($ScriptBlock.ToString()))
$Arg = "-NoProfile -EncodedCommand $Encoded"

$Action = New-ScheduledTaskAction -Execute "powershell.exe" -Argument $Arg

# Trigger
$Trigger = New-ScheduledTaskTrigger -Weekly -DaysOfWeek Friday -At 12pm

# Principal
$Principal = New-ScheduledTaskPrincipal -UserId "SYSTEM" -LogonType ServiceAccount -RunLevel Highest

# Register
Register-ScheduledTask -TaskName $TaskName -Action $Action -Trigger $Trigger -Principal $Principal -Description "Weekly cleanup script deployed by Intune"

Write-Host "Task created successfully." -ForegroundColor Green
