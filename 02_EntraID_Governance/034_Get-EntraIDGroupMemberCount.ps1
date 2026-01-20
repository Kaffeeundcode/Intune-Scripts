<#
.SYNOPSIS
    Zählt die Mitglieder aller Gruppen und warnt bei sehr großen Gruppen.

.DESCRIPTION
    Hilft, "Monster-Gruppen" zu finden, die ggf. Governance-Probleme verursachen.

    Parameter:
    - Limit: Warnschwelle (Default: 500)

.NOTES
    File Name: 034_Get-EntraIDGroupMemberCount.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [Parameter(Mandatory=$false)] [int]$Limit = 500
)

try {
    Write-Host "Analysiere Gruppengrößen..." -ForegroundColor Cyan
    
    # Get-MgGroup liefert nicht direkt Anzahl, wir müssen pagen oder Members abfragen. 
    # Performance-Tipp: Bei sehr vielen Gruppen via Beta Property 'resourceProvisioningOptions' oder Graph Select prüfen.
    # Hier: Basis-Abfrage. 
    
    $Groups = Get-MgGroup -All -Property Id, DisplayName
    
    $LargeGroups = @()
    foreach ($g in $Groups) {
        # Schnellcheck via Graph Count
        # GET /groups/{id}/members/$count?ConsistencyLevel=eventual
        $CountUrl = "https://graph.microsoft.com/v1.0/groups/$($g.Id)/members/`$count"
        $Count = Invoke-MgGraphRequest -Method GET -Uri $CountUrl -Headers @{"ConsistencyLevel" = "eventual"} -ErrorAction SilentlyContinue
        
        if ($Count -ge $Limit) {
            $LargeGroups += [PSCustomObject]@{
                GroupName = $g.DisplayName
                MemberCount = $Count
                GroupId = $g.Id
            }
        }
    }
    
    $LargeGroups | Sort-Object MemberCount -Descending | Format-Table -AutoSize

} catch {
    Write-Error "Fehler: $_"
}
