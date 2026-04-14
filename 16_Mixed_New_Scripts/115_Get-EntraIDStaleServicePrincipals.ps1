<#
.SYNOPSIS
    Identifies Service Principals (Enterprise Apps) that have not signed in recently.

.DESCRIPTION
    Scanning 'SignInLogs' for ServicePrincipals is key to reducing attack surface.
    This script looks for SPs that haven't had a successful sign-in log in the last X days.
    
    Note: Requires P1/P2 for SignInLogs access.

.NOTES
    File Name  : 115_Get-EntraIDStaleServicePrincipals.ps1
    Author     : Kaffeeundcode
    Version    : 1.0
#>

Param(
    [int]$Days = 90
)

try {
    Connect-MgGraph -Scopes "AuditLog.Read.All", "Directory.Read.All" -ErrorAction Stop
} catch {
    Write-Error "Login failed"
    exit
}

Write-Host "Fetching Service Principal Sign-Ins (Last $Days days)..." -ForegroundColor Cyan
$DateCutoff = (Get-Date).AddDays(-$Days).ToString("yyyy-MM-ddTHH:mm:ssZ")

# This is an expensive query if we pull all logs.
# Strategy: usage of 'Get-MgServicePrincipal' and check 'signInActivity' (if available in beta) is better.

Select-MgProfile -Name "beta"
# Beta profile often exposes 'signInActivity' on the object itself for SPs/Apps sometimes, 
# but consistently for Users. For SPs, we often rely on summary reports.

# Let's try the managedIdentitySignIn logs specifically or standard logs filter
try {
    $Logs = Get-MgAuditLogSignIn -Filter "createdDateTime ge $DateCutoff and signInEventTypes/any(t:t eq 'servicePrincipal')" -Top 1000 
    # Logic: If an AppId effectively appears in logs, it is active.
    
    $ActiveAppIds = $Logs | Select-Object -ExpandProperty AppId -Unique
    
    # Get all SPs
    $AllSPs = Get-MgServicePrincipal -All -Filter "servicePrincipalType eq 'Application'"
    
    $StaleSPs = @()
    foreach ($SP in $AllSPs) {
        if ($SP.AppId -notin $ActiveAppIds) {
             # Verify creation date to ensure it's not brand new
             $Created = $SP.CreatedDateTime
             if ($Created -and $Created -lt (Get-Date).AddDays(-$Days)) {
                 $StaleSPs += [PSCustomObject]@{
                     DisplayName = $SP.DisplayName
                     AppId = $SP.AppId
                     Created = $Created
                     Status = "No recent sign-ins found in sample"
                 }
             }
        }
    }
    
    $StaleSPs | Select-Object -First 50 | Format-Table DisplayName, AppId, Created -AutoSize
    Write-Host "Potential Stale SPs identified: $($StaleSPs.Count)" -ForegroundColor Yellow
    
} catch {
    Write-Warning "Could not query Sign-in logs. Ensure you have Azure AD Premium P1."
}
