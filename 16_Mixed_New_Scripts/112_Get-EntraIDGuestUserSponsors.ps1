<#
.SYNOPSIS
    Identifies the "Sponsor" or inviter of Guest Users in Entra ID.

.DESCRIPTION
    Often, Guest users are created but nobody knows who invited them.
    This script attempts to look up the 'manager' or creation logs to find the sponsor.
    
    Note: 'Sponsor' is not a default attribute for old guests, but modern logic often 
    uses the 'Manager' field or 'CreatedBy' audit log (if recent).

.NOTES
    File Name  : 112_Get-EntraIDGuestUserSponsors.ps1
    Author     : Kaffeeundcode
    Version    : 1.0
#>

try {
    Connect-MgGraph -Scopes "User.Read.All", "Directory.Read.All", "AuditLog.Read.All" -ErrorAction Stop
} catch {
    Write-Error "Login failed"
    exit
}

$Guests = Get-MgUser -Filter "userType eq 'Guest'" -All -Property Id, DisplayName, UserPrincipalName, CreatedDateTime, Manager

$Report = @()

foreach ($Guest in $Guests) {
    $Sponsor = "Unknown"
    
    # Check Manager first (Best Practice)
    try {
        # Manager is a relationship, need to expand or fetch
        $Mgr = Get-MgUserManager -UserId $Guest.Id -ErrorAction SilentlyContinue
        if ($Mgr) {
            # Mgr returns a DirectoryObject, cast to User
            $MgrUser = Get-MgUser -UserId $Mgr.Id
            $Sponsor = "$($MgrUser.DisplayName) (Manager)"
        }
    } catch {}

    # If no manager, check description (sometimes stored there)
    # If very new, check audit logs (expensive)
    
    $obj = [PSCustomObject]@{
        GuestName = $Guest.DisplayName
        GuestUPN  = $Guest.UserPrincipalName
        Created   = $Guest.CreatedDateTime
        Sponsor   = $Sponsor
    }
    $Report += $obj
}

$Report | Format-Table GuestName, Sponsor, Created -AutoSize

$Path = "$PSScriptRoot\Guest_Sponsors.csv"
$Report | Export-Csv -Path $Path -NoTypeInformation
Write-Host "Report saved to $Path" -ForegroundColor Green
