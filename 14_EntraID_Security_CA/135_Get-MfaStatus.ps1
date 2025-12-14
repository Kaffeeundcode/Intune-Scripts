<#
.SYNOPSIS
    Prüft MFA Registrierungen (Authentication Methods).
    
.DESCRIPTION
    Zeigt, welche Auth-Methoden ein User registriert hat (App, Phone etc.).
    Erfordert die Berechtigung 'UserAuthenticationMethod.Read.All'.

.NOTES
    File Name: 135_Get-MfaStatus.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [string]$UserUPN
)

Connect-MgGraph -Scopes "UserAuthenticationMethod.Read.All"

$User = Get-MgUser -UserId $UserUPN
if ($User) {
    Get-MgUserAuthenticationMethod -UserId $User.Id | Select-Object @{N='Type';E={$_.AdditionalProperties['@odata.type']}}
}
