<#
.SYNOPSIS
    Zeigt die "Direct Reports" (Untergebenen) eines Managers.
    
.DESCRIPTION
    Listet alle Benutzer auf, die diesen User als Manager eingetragen haben.
    Erfordert die Berechtigung 'User.Read.All'.

.NOTES
    File Name: 107_Get-UserDirectReports.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [Parameter(Mandatory=$true)]
    [string]$ManagerUPN
)

Connect-MgGraph -Scopes "User.Read.All"

$Manager = Get-MgUser -UserId $ManagerUPN
if ($Manager) {
    Get-MgUserDirectReport -UserId $Manager.Id | Select-Object Id, @{N='Name';E={$_.AdditionalProperties.displayName}}
}
