<#
.SYNOPSIS
    Basic check and repair for WMI consistency.

.DESCRIPTION
    Runs 'winmgmt /verifyrepository'.
    If inconsistent, attempts '/salvagerepository'.
    
    WARNING: Restarting WMI service can impact running services (IPHelper, etc).
    Use with caution.

.NOTES
    File Name  : 150_Repair-WMIHealth.ps1
    Author     : Kaffeeundcode
    Version    : 1.0
#>

Write-Host "Checking WMI Repository..." -ForegroundColor Cyan

$Res = winmgmt /verifyrepository

if ($Res -match "INCONSISTENT") {
    Write-Warning "WMI Repository is INCONSISTENT!"
    
    Write-Host "Attempting Salvage..." -ForegroundColor Yellow
    winmgmt /salvagerepository
    
    # Check again
    $Res2 = winmgmt /verifyrepository
    if ($Res2 -match "CONSISTENT") {
        Write-Host "Repair Successful." -ForegroundColor Green
    } else {
        Write-Error "Repair Failed. Manual intervention required."
    }
} else {
    Write-Host "WMI is Healthy (CONSISTENT)." -ForegroundColor Green
}
