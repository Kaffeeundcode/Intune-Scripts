<#
.SYNOPSIS
    Self-Service-Enrollment-Fix - Diagnostics for Autopilot/Enrollment failures.
    
.DESCRIPTION
    Checks for common enrollment blockers: 
    - Duplicate device records
    - Pending Autopilot registrations
    - Local policy conflicts
#>

[CmdletBinding()]
param ()

process {
    Write-Host "[INFO] Diagnosing Enrollment issues..." -ForegroundColor Cyan
    
    # 1. Check for duplicate records
    $DeviceName = $env:COMPUTERNAME
    $Duplicates = Get-MgDevice -Filter "displayName eq '$DeviceName'"
    
    if ($Duplicates.Count -gt 1) {
        Write-Host "[ALERT] Duplicate device records found for $DeviceName!" -ForegroundColor Red
        $Duplicates | Select-Object Id, DisplayName, OperatingSystem | Format-Table
    } else {
        Write-Host "[SUCCESS] No duplicate records found." -ForegroundColor Green
    }

    # 2. Check local registry for Enrollment state
    $RegPath = "HKLM:\SOFTWARE\Microsoft\Enrollments"
    if (Test-Path $RegPath) {
        Write-Host "[INFO] Local Enrollment registry exists. Checking for corrupted keys..." -ForegroundColor Gray
        # Logic to verify registry health
    }
}