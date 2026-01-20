<#
.SYNOPSIS
    Prüft alle Mailboxen auf Weiterleitungsregeln (Inbox Rules).

.DESCRIPTION
    Weiterleitungen sind ein Sicherheitsrisiko (Data Exfiltration).
    Dieses Skript listet alle Regeln auf, die "ForwardTo" oder "RedirectTo" nutzen.
    Benötigt ExchangeOnlineManagement Modul (Connect-ExchangeOnline).

    Parameter:
    - UserPrincipalName: (Optional) Nur eine Mailbox prüfen.

.NOTES
    File Name: 061_Get-ExoMailboxForwardingRules.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [Parameter(Mandatory=$false)] [string]$UserPrincipalName
)

try {
    Write-Host "Suche Weiterleitungsregeln..." -ForegroundColor Cyan
    
    $Mailboxes = if ($UserPrincipalName) { Get-ExoMailbox -Identity $UserPrincipalName } else { Get-ExoMailbox -ResultSize Unlimited }

    foreach ($mb in $Mailboxes) {
        $Rules = Get-InboxRule -Mailbox $mb.UserPrincipalName -ErrorAction SilentlyContinue | Where-Object { $_.ForwardTo -or $_.RedirectTo }
        
        if ($Rules) {
            foreach ($r in $Rules) {
                Write-Warning "User: $($mb.UserPrincipalName) | Regel: $($r.Name) | Leitet an: $($r.ForwardTo)$($r.RedirectTo)"
            }
        }
    }

} catch {
    Write-Error "Fehler (Benötigt Exchange Online Connection): $_"
}
