<#
.SYNOPSIS
    Prüft Sync-Status von On-Premises Gruppen.

.DESCRIPTION
    <!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Zeigt an, wann eine synchronisierte Gruppe zuletzt aktualisiert wurde.
    Erfordert die Berechtigung 'Group.Read.All'.

.NOTES
    File Name: 120_Sync-OnPremGroups.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [string]$GroupName
)

Connect-MgGraph -Scopes "Group.Read.All"

$Group = Get-MgGroup -Filter "displayName eq '$GroupName'" -Property OnPremisesLastSyncDateTime, OnPremisesSyncEnabled
if ($Group.OnPremisesSyncEnabled) {
    Write-Host "Last Sync: $($Group.OnPremisesLastSyncDateTime)"
} else {
    Write-Host "Reine Cloud-Gruppe."
}
