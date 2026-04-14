<#
.SYNOPSIS
    Exports a comprehensive report of Mailbox Delegations (Full Access, Send As).

.DESCRIPTION
    Iterates through all user mailboxes and retrieves permissions.
    Filters out 'Self' permissions to show only delegated access.
    
    Warning: Can be slow on large tenants.

.NOTES
    File Name  : 132_Get-ExoMailboxDelegationReport.ps1
    Author     : Kaffeeundcode
    Version    : 1.0
#>

try {
    # Requires ExchangeOnlineManagement
    Connect-ExchangeOnline -ErrorAction Stop
} catch {
    Write-Error "Login failed"
    exit
}

$Mailboxes = Get-ExoMailbox -ResultSize Unlimited -RecipientTypeDetails UserMailbox

$Report = @()

foreach ($Mbx in $Mailboxes) {
    Write-Host "Checking $($Mbx.UserPrincipalName)..." -NoNewline
    
    # Full Access
    $Perms = Get-ExoMailboxPermission -Identity $Mbx.UserPrincipalName | Where-Object { $_.User -notlike "*S-1-5-*" -and $_.User -ne "NT AUTHORITY\SELF" }
    
    # Send As
    $SendAs = Get-ExoRecipientPermission -Identity $Mbx.UserPrincipalName | Where-Object { $_.Trustee -notlike "*S-1-5-*" -and $_.Trustee -ne "NT AUTHORITY\SELF" }
    
    foreach ($P in $Perms) {
        $Report += [PSCustomObject]@{
            Mailbox = $Mbx.UserPrincipalName
            Delegate = $P.User
            AccessType = "FullAccess"
        }
    }
    
    foreach ($S in $SendAs) {
        $Report += [PSCustomObject]@{
            Mailbox = $Mbx.UserPrincipalName
            Delegate = $S.Trustee
            AccessType = "SendAs"
        }
    }
    Write-Host "." -ForegroundColor Green
}

$Report | Select-Object -First 20 | Format-Table Mailbox, Delegate, AccessType -AutoSize
$Report | Export-Csv "$PSScriptRoot\Mailbox_Delegation_Report.csv" -NoTypeInformation
Write-Host "Full report saved." -ForegroundColor Green
