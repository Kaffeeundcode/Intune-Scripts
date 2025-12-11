<#
.SYNOPSIS
    Ruft Anmeldehistorie (Sign-Ins) ab (Azure AD).
    
.DESCRIPTION
    Zeigt letzte Anmeldungen an. Achtung: Benötigt hohe Rechte!
    Erfordert die Berechtigung 'AuditLog.Read.All'.

.NOTES
    File Name: 57_Get-UserLoginHistory.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param(
    [string]$UserPrincipalName
)

Connect-MgGraph -Scopes "AuditLog.Read.All"

if ($UserPrincipalName) {
    Get-MgAuditLogSignIn -Filter "userPrincipalName eq '$UserPrincipalName'" -Top 10 | Select-Object CreatedDateTime, IpAddress, AppDisplayName, Status
} else {
    Get-MgAuditLogSignIn -Top 10 | Select-Object CreatedDateTime, UserPrincipalName, AppDisplayName, Status
}
