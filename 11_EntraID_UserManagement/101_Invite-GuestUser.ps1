<#
.SYNOPSIS
    Lädt einen Gastbenutzer (B2B) in Entra ID ein.
    
.DESCRIPTION
    Versendet eine Einladung an eine externe E-Mail-Adresse und fügt den User dem Directory hinzu.
    Erfordert die Berechtigung 'User.Invite.All'.

.NOTES
    File Name: 101_Invite-GuestUser.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [Parameter(Mandatory=$true)]
    [string]$EmailAddress,
    
    [string]$DisplayName = "Guest User",
    [string]$RedirectUrl = "https://myapps.microsoft.com"
)

Connect-MgGraph -Scopes "User.Invite.All"

$Invite = New-MgInvitation -InvitedUserEmailAddress $EmailAddress -InvitedUserDisplayName $DisplayName -InviteRedirectUrl $RedirectUrl -SendInvitationMessage:$true

Write-Host "Einladung gesendet an: $EmailAddress"
Write-Host "Status: $($Invite.Status)"
Write-Host "Redemption URL: $($Invite.InviteRedeemUrl)"
