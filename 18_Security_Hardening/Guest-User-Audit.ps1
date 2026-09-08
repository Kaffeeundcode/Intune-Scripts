<#
.SYNOPSIS
    Guest-User-Audit - Lists external guest users and their last activity.

.DESCRIPTION
    <!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Aus dem bestehenden GitHub-Bestand übernommen; fachliche und Tenant-Abnahme ausstehend.

    <!-- library-status:end -->

    Identifies all guest users in the tenant to manage external access and
    clean up stale guest accounts.
#>

[CmdletBinding()]
param ()

process {
    Write-Host "[INFO] Auditing Guest Users..." -ForegroundColor Cyan

    $Guests = Get-MgUser -Filter "userType eq 'Guest'" -All

    if ($Guests) {
        $Guests | Select-Object DisplayName, Mail, ExternalUserState, CreatedDateTime | Format-Table
        Write-Host "[INFO] Total Guests: $($Guests.Count)" -ForegroundColor Gray
    } else {
        Write-Host "[SUCCESS] No guest users found." -ForegroundColor Green
    }
}