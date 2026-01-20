<#
.SYNOPSIS
    Erstellt eine Shared Mailbox und weist direkt Vollzugriff zu.

.DESCRIPTION
    Standardisiert die Erstellung von Shared Mailboxes.
    
    Parameter:
    - Name: Display Name
    - Email: Primäre SMTP Adresse
    - FullAccessUsers: Liste von UPNs für Full Access

.NOTES
    File Name: 064_New-ExoSharedMailboxAutomation.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [Parameter(Mandatory=$true)] [string]$Name,
    [Parameter(Mandatory=$true)] [string]$Email,
    [Parameter(Mandatory=$false)] [string[]]$FullAccessUsers
)

try {
    Write-Host "Erstelle Shared Mailbox '$Name' ($Email)..." -ForegroundColor Cyan
    
    New-Mailbox -Shared -Name $Name -DisplayName $Name -PrimarySmtpAddress $Email -ErrorAction Stop
    
    if ($FullAccessUsers) {
        foreach ($u in $FullAccessUsers) {
            Write-Host "Gebe Vollzugriff an $u..."
            Add-MailboxPermission -Identity $Email -User $u -AccessRights FullAccess -AutoMapping $true -ErrorAction Stop
        }
    }
    
    Write-Host "Fertig." -ForegroundColor Green

} catch {
    Write-Error "Fehler: $_"
}
