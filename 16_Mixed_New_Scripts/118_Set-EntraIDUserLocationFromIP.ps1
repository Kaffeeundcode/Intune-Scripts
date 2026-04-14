<#
.SYNOPSIS
    Suggests Usage Location updates for users based on their recent successful sign-in IP.

.DESCRIPTION
    Users in Entra ID need a UsageLocation to be assigned licenses.
    This script looks at the last successful interactive sign-in, determines the country from
    the IP address (via Graph Sign-in logs), and suggests setting the UsageLocation.
    
    Use -Confirm to apply.

.NOTES
    File Name  : 118_Set-EntraIDUserLocationFromIP.ps1
    Author     : Kaffeeundcode
    Version    : 1.0
#>

Param(
    [switch]$Apply
)

try {
    Connect-MgGraph -Scopes "AuditLog.Read.All", "User.ReadWrite.All", "Directory.Read.All" -ErrorAction Stop
} catch {
    Write-Error "Login failed"
    exit
}

# Find users without UsageLocation
$Users = Get-MgUser -Filter "usageLocation eq null and userType eq 'Member'" -All -Property Id, DisplayName, UserPrincipalName

Write-Host "Found $($Users.Count) users with no UsageLocation." -ForegroundColor Yellow

$Updates = @()

foreach ($User in $Users) {
    # Get last successful sign-in
    $Logs = Get-MgAuditLogSignIn -Filter "userPrincipalName eq '$($User.UserPrincipalName)' and status/errorCode eq 0" -Top 1
    
    if ($Logs) {
        $Country = $Logs.Location.CountryOrRegion
        if ($Country -and $Country.Length -eq 2) {
             # Graph usually returns 2-letter ISO code in location.countryOrRegion e.g. "US", "DE"
             # Sometimes it's full name. We need 2-letter for UsageLocation.
             
             # Caution: Graph 'Location' object format varies. Verify.
             # Often it is strictly 2 chars.
             
             $Updates += [PSCustomObject]@{
                 User = $User.UserPrincipalName
                 DetectedCountry = $Country
                 Id = $User.Id
             }
        }
    }
}

$Updates | Format-Table User, DetectedCountry

if ($Apply) {
    foreach ($U in $Updates) {
        Write-Host "Setting $($U.User) to $($U.DetectedCountry)..." -NoNewline
        Update-MgUser -UserId $U.Id -UsageLocation $U.DetectedCountry
        Write-Host "Done" -ForegroundColor Green
    }
} else {
    Write-Warning "Run with -Apply to update users."
}
