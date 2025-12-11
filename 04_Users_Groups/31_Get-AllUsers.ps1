<#
.SYNOPSIS
    Listet alle Benutzer im Tenant auf.
    
.DESCRIPTION
    Ruft alle Azure AD Benutzer ab.
    Erfordert die Berechtigung 'User.Read.All'.

.NOTES
    File Name: 31_Get-AllUsers.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param()

Connect-MgGraph -Scopes "User.Read.All"

Write-Host "Lade Benutzer..."
$Users = Get-MgUser -All

Write-Host "Gefundene Benutzer: $($Users.Count)" -ForegroundColor Cyan
$Users | Select-Object DisplayName, UserPrincipalName, Id, AccountEnabled | Format-Table -AutoSize
