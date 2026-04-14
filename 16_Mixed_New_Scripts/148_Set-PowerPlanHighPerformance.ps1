<#
.SYNOPSIS
    Enforces 'High Performance' power plan when connected to AC power.

.DESCRIPTION
    Prevents devices from sleeping aggressively when plugged in.
    Useful for Kiosk devices or developer machines.
    
    Uses powercfg.exe.

.NOTES
    File Name  : 148_Set-PowerPlanHighPerformance.ps1
    Author     : Kaffeeundcode
    Version    : 1.0
#>

Write-Host "Checking Power Schemes..." -ForegroundColor Cyan

# Find High Perf GUID
$Plans = powercfg /list
$HighPerf = $Plans | Select-String "High performance"

if ($HighPerf) {
    if ($HighPerf -match "GUID: ([a-f0-9\-]+)") {
        $Guid = $matches[1]
        Write-Host "Found High Performance: $Guid" -ForegroundColor Green
        
        # Set Active
        powercfg /setactive $Guid
        Write-Host "Set to Active."
        
        # Ensure AC settings prevent sleep (Timeout 0)
        powercfg /change monitor-timeout-ac 0
        powercfg /change standby-timeout-ac 0
        powercfg /change hibernate-timeout-ac 0
        
        Write-Host "Sleep timeouts disabled on AC." -ForegroundColor Green
    }
} else {
    Write-Warning "High Performance plan not found. It might be hidden on Modern Standby devices."
    # Attempt to use 'Ultimate Performance' or duplicate Balanced
}
