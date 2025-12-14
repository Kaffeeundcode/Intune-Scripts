<#
.SYNOPSIS
    Prüft Sign-Ins für eine spezifische App.
    
.DESCRIPTION
    Zeigt, wer sich wann an dieser App angemeldet hat.
    Erfordert die Berechtigung 'AuditLog.Read.All'.

.NOTES
    File Name: 130_Check-AppSignInLogs.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [string]$AppName
)

Connect-MgGraph -Scopes "AuditLog.Read.All"

Get-MgAuditLogSignIn -Filter "appDisplayName eq '$AppName'" -Top 20 | Select-Object CreatedDateTime, UserPrincipalName, Status
