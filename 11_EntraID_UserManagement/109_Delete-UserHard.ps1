<#
.SYNOPSIS
    Löscht einen Benutzer (Soft Delete).
    
.DESCRIPTION
    Verschiebt einen Benutzer in den Papierkorb. Endgültiges Löschen erfolgt nach 30 Tagen oder via 'Restore-'.
    Erfordert die Berechtigung 'User.ReadWrite.All'.

.NOTES
    File Name: 109_Delete-UserHard.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [Parameter(Mandatory=$true)]
    [string]$UserPrincipalName
)

Connect-MgGraph -Scopes "User.ReadWrite.All"

Remove-MgUser -UserId $UserPrincipalName
Write-Host "Benutzer $UserPrincipalName gelöscht (Papierkorb)." -ForegroundColor Red
