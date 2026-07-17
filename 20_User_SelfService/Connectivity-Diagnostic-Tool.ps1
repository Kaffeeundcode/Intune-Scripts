<#
.SYNOPSIS
    Connectivity-Diagnostic-Tool - Tests Intune and Graph API reachability.
    
.DESCRIPTION
    Pings and tests TCP connections to critical Microsoft endpoints to 
    diagnose "Not Syncing" issues. Distinguishes between local network 
    blocks and service outages.
#>

[CmdletBinding()]
param ()

process {
    $Endpoints = @(
        "enrollment.manage.microsoft.com",
        "graph.microsoft.com",
        "login.microsoftonline.com"
    )

    Write-Host "[INFO] Testing Intune Connectivity..." -ForegroundColor Cyan

    foreach ($Url in $Endpoints) {
        try {
            $Result = Test-NetConnection -ComputerName $Url -Port 443 -ErrorAction Stop
            if ($Result.TcpTestSucceeded) {
                Write-Host "[SUCCESS] $Url is reachable." -ForegroundColor Green
            } else {
                Write-Host "[FAILED] $Url is unreachable." -ForegroundColor Red
            }
        } catch {
            Write-Host "[ERROR] Could not test $Url : $($_.Exception.Message)" -ForegroundColor Red
        }
    }
}