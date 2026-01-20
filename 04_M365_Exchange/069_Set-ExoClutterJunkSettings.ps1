<#
.SYNOPSIS
    Konfiguriert die Junk-Email Konfiguration für einen Benutzer.

.DESCRIPTION
    Aktiviert/Deaktiviert Junk-Filter und fügt Safe Senders hinzu.

    Parameter:
    - Identity: Mailbox
    - EnableJunkConfig: $true/$false
    - TrustedSenders: Liste von Domains/Adressen

.NOTES
    File Name: 069_Set-ExoClutterJunkSettings.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [Parameter(Mandatory=$true)] [string]$Identity,
    [Parameter(Mandatory=$false)] [bool]$EnableJunkConfig = $true,
    [Parameter(Mandatory=$false)] [string[]]$TrustedSenders
)

try {
    Write-Host "Konfiguriere Junk Email für '$Identity'..." -ForegroundColor Cyan
    
    Set-MailboxJunkEmailConfiguration -Identity $Identity -Enabled $EnableJunkConfig -ErrorAction Stop
    
    if ($TrustedSenders) {
        Write-Host "Füge Trusted Senders hinzu..."
        Set-MailboxJunkEmailConfiguration -Identity $Identity -TrustedSendersAndDomains @{Add=$TrustedSenders} -ErrorAction Stop
    }
    
    Write-Host "Konfiguration abgeschlossen." -ForegroundColor Green

} catch {
    Write-Error "Fehler: $_"
}
