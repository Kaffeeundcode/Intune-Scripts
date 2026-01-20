<#
.SYNOPSIS
    Findet und löscht leere Resource Groups.

.DESCRIPTION
    Leere RGs verschmutzen die Umgebung. Dieses Skript findet Gruppen ohne Ressourcen.
    Mit -Delete werden sie gelöscht.

    Parameter:
    - Delete: Switch zum Löschen.

.NOTES
    File Name: 020_Remove-AzEmptyResourceGroups.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [Parameter(Mandatory=$false)] [switch]$Delete
)

try {
    Write-Host "Suche leere Resource Groups..." -ForegroundColor Cyan
    
    $RGs = Get-AzResourceGroup
    $EmptyRGs = @()

    foreach ($rg in $RGs) {
        $Resources = Get-AzResource -ResourceGroupName $rg.ResourceGroupName -ErrorAction SilentlyContinue
        if (-not $Resources) {
            $EmptyRGs += $rg
        }
    }

    if ($EmptyRGs.Count -eq 0) {
        Write-Host "Keine leeren Gruppen gefunden." -ForegroundColor Green
        exit
    }

    Write-Host "$($EmptyRGs.Count) leere Gruppen gefunden:" -ForegroundColor Yellow
    $EmptyRGs.ResourceGroupName

    if ($Delete) {
        foreach ($rg in $EmptyRGs) {
            Write-Host "Lösche '$($rg.ResourceGroupName)'..." -NoNewline
            Remove-AzResourceGroup -Name $rg.ResourceGroupName -Force -ErrorAction Stop
            Write-Host " OK." -ForegroundColor Green
        }
    } else {
        Write-Host "Nutzen Sie '-Delete', um diese zu entfernen." -ForegroundColor Cyan
    }

} catch {
    Write-Error "Fehler: $_"
}
