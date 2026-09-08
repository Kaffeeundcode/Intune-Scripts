<#
.SYNOPSIS
    Findet Gruppen ohne Besitzer (Orphaned Groups).

.DESCRIPTION
    <!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Durchsucht alle Gruppen und prüft, ob die Owner-Liste leer ist.
    Erfordert die Berechtigung 'Group.Read.All'.

.NOTES
    File Name: 116_Find-OrphanedGroups.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param()

Connect-MgGraph -Scopes "Group.Read.All"

$Groups = Get-MgGroup -All
foreach ($G in $Groups) {
    $Owners = Get-MgGroupOwner -GroupId $G.Id -ErrorAction SilentlyContinue
    if (!$Owners) {
        Write-Host "Gruppe ohne Owner: $($G.DisplayName)" -ForegroundColor Yellow
    }
}
