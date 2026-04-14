<#
.SYNOPSIS
    Identifies "Shadow IT" applications where users have consented to high-privilege scopes.

.DESCRIPTION
    Scans all Service Principals (Enterprise Apps) in Entra ID.
    Looks for OAuth2PermissionGrants containing sensitive scopes like:
    - Directory.ReadWrite.All
    - User.ReadWrite.All
    - Mail.ReadWrite
    - Files.ReadWrite
    
    This helps identify risky 3rd party apps users may have connected.

.NOTES
    File Name  : 111_Get-EntraIDShadowITApps.ps1
    Author     : Kaffeeundcode
    Version    : 1.0
#>

try {
    Connect-MgGraph -Scopes "DelegatedPermissionGrant.Read.All", "Application.Read.All" -ErrorAction Stop
} catch {
    Write-Error "Login failed"
    exit
}

Write-Host "Scanning for High-Risk Consents (Shadow IT)..." -ForegroundColor Cyan

# Define what we consider "High Risk"
$RiskyKeywords = @("ReadWrite.All", "FullControl", "Directory.Read", "Mail.Send")

# Get All Permission Grants
$Grants = Get-MgOAuth2PermissionGrant -All

$Report = @()

foreach ($Grant in $Grants) {
    # Check if any scope matches risky keywords
    $Scopes = $Grant.Scope -split " "
    $IsRisky = $false
    $FoundRisks = @()

    foreach ($S in $Scopes) {
        foreach ($K in $RiskyKeywords) {
            if ($S -match $K) {
                $IsRisky = $true
                $FoundRisks += $S
            }
        }
    }

    if ($IsRisky) {
        # Get App Name (this is slower, so we only do it for risky ones)
        # ClientId is the App ID
        $App = Get-MgServicePrincipal -Filter "appId eq '$($Grant.ClientId)'" -ErrorAction SilentlyContinue
        
        # Get User (PrincipalId) - could be a user or 'AllPrincipals'
        $UserDisplay = "All Users"
        if ($Grant.PrincipalId -ne $null -and $Grant.ConsentType -eq "Principal") {
            $User = Get-MgUser -UserId $Grant.PrincipalId -ErrorAction SilentlyContinue
            if ($User) { $UserDisplay = $User.UserPrincipalName } else { $UserDisplay = $Grant.PrincipalId }
        }

        $obj = [PSCustomObject]@{
            AppName      = if ($App) { $App.DisplayName } else { $Grant.ClientId }
            User         = $UserDisplay
            RiskyScopes  = ($FoundRisks -join ", ")
            AllScopes    = $Grant.Scope
            ConsentType  = $Grant.ConsentType
        }
        $Report += $obj
    }
}

$Report | Format-Table AppName, User, RiskyScopes -AutoSize
$Path = "$PSScriptRoot\ShadowIT_Report.csv"
$Report | Export-Csv -Path $Path -NoTypeInformation
Write-Host "Report saved to $Path" -ForegroundColor Green
