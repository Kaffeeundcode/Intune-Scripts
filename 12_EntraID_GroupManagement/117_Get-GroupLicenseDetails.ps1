<#
.SYNOPSIS
    Prüft, ob einer Gruppe Lizenzen zugewiesen sind (Group Based Licensing).
    
.DESCRIPTION
    Zeigt zugewiesene Lizenzen auf Gruppenebene an.
    Erfordert die Berechtigung 'Group.Read.All'.

.NOTES
    File Name: 117_Get-GroupLicenseDetails.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [string]$GroupName
)

Connect-MgGraph -Scopes "Group.Read.All"

$Group = Get-MgGroup -Filter "displayName eq '$GroupName'" -Property AssignedLicenses, DisplayName, Id
if ($Group.AssignedLicenses) {
    $Group.AssignedLicenses | Select-Object SkuId, DisabledPlans
} else {
    Write-Host "Keine Lizenzen direkt zugewiesen."
}
