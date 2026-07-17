<#
.SYNOPSIS
    Shadow-IT-Scanner - Identifies unmanaged Enterprise App registrations.
    
.DESCRIPTION
    Scans Entra ID for App Registrations that were created by users 
    without administrative oversight or lacking a proper owner.
#>

[CmdletBinding()]
param ()

process {
    Write-Host "[INFO] Scanning for Shadow IT App Registrations..." -ForegroundColor Cyan
    
    $Apps = Get-MgApplication -All
    $ShadowApps = $Apps | Where-Object { $_.AppOwner -eq $null -or $_.AppOwner.Count -eq 0 }

    if ($ShadowApps) {
        $ShadowApps | Select-Object DisplayName, AppId, CreatedDateTime | Format-Table
        Write-Host "[ALERT] Found $($ShadowApps.Count) unmanaged applications." -ForegroundColor Yellow
    } else {
        Write-Host "[SUCCESS] No Shadow IT apps detected." -ForegroundColor Green
    }
}