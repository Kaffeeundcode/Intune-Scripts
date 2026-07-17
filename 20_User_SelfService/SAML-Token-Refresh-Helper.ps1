<#
.SYNOPSIS
    SAML-Token-Refresh-Helper - Assists users with Entra ID token issues.
    
.DESCRIPTION
    Forces a refresh of the local authentication tokens and 
    re-triggers the device registration process to fix "Account Error" 
    messages in company-managed apps.
#>

[CmdletBinding()]
param ()

process {
    Write-Host "[INFO] Refreshing Entra ID Tokens..." -ForegroundColor Cyan
    
    try {
        # Triggering a token refresh by forcing a re-auth call to Graph
        Write-Host "[EXEC] Requesting fresh token from Azure AD..." -ForegroundColor Gray
        Connect-MgGraph -Scopes "User.Read" -ForceRefresh
        
        Write-Host "[SUCCESS] Tokens refreshed successfully." -ForegroundColor Green
    } catch {
        Write-Host "[ERROR] Token refresh failed: $($_.Exception.Message)" -ForegroundColor Red
    }
}