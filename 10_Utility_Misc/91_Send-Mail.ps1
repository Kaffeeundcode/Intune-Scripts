<#
.SYNOPSIS
    Verschickt eine E-Mail (via Graph).
    
.DESCRIPTION
    Sendet eine Mail aus dem Postfach des angemeldeten Users.
    Erfordert die Berechtigung 'Mail.Send'.

.NOTES
    File Name: 91_Send-Mail.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [string]$To,
    [string]$Subject,
    [string]$Body
)

Connect-MgGraph -Scopes "Mail.Send"

$Message = @{
    subject = $Subject
    body = @{ contentType = "Text"; content = $Body }
    toRecipients = @(@{ emailAddress = @{ address = $To } })
}

Send-MgUserMail -UserId (Get-MgContext).Account -Message $Message
Write-Host "Mail gesendet."
