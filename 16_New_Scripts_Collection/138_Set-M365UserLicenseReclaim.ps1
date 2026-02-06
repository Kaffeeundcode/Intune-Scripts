<#
.SYNOPSIS
    Identifies disabled users who still hold a license and offers to reclaim them.

.DESCRIPTION
    Cost saving: Finds 'AccountEnabled = False' users with assigned licenses.
    If -Reclaim switch is used, it removes the licenses.

.NOTES
    File Name  : 138_Set-M365UserLicenseReclaim.ps1
    Author     : Kaffeeundcode
    Version    : 1.0
#>

Param(
    [switch]$Reclaim
)

try {
    Connect-MgGraph -Scopes "User.ReadWrite.All" -ErrorAction Stop
} catch {
    Write-Error "Login failed"
    exit
}

Write-Host "Searching for disabled users with licenses..." -ForegroundColor Cyan
$Users = Get-MgUser -Filter "accountEnabled eq false and assignedLicenses/any()" -All -Property Id, UserPrincipalName, DisplayName, AssignedLicenses

$Report = @()

foreach ($User in $Users) {
    if ($User.AssignedLicenses.Count -gt 0) {
        Write-Host "Found: $($User.UserPrincipalName)" -ForegroundColor Yellow
        $Report += [PSCustomObject]@{
            User = $User.UserPrincipalName
            Id = $User.Id
            LicenseCount = $User.AssignedLicenses.Count
        }
        
        if ($Reclaim) {
            # Logic to remove licenses
            # Check user Lics
            # Remove-MgUserAssignedLicense ...
            
            Write-Host " Removing licenses..." -NoNewline
            try {
                Set-MgUserLicense -UserId $User.Id -RemoveLicenses @($User.AssignedLicenses.SkuId) -AddLicenses @{}
                Write-Host " Success." -ForegroundColor Green
            } catch {
                Write-Host " Failed: $_" -ForegroundColor Red
            }
        }
    }
}

if (-not $Reclaim) {
    $Report | Format-Table User, LicenseCount -AutoSize
    Write-Warning "Run with -Reclaim to actually remove licenses."
}
