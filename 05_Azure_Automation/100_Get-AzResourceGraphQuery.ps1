<#
.SYNOPSIS
    Führt eine schnelle Azure Resource Graph Query aus.

.DESCRIPTION
    Resource Graph ist oft schneller als Get-AzResource.
    Beispiel: Zähle alle Ressourcen pro Typ.
    
    Parameter:
    - Query: (Optional) Custom Query.

.NOTES
    File Name: 100_Get-AzResourceGraphQuery.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [Parameter(Mandatory=$false)] [string]$Query = "Resources | summarize count() by type | order by count_ desc"
)

try {
    Write-Host "Führe Resource Graph Query aus..." -ForegroundColor Cyan

    $Result = Search-AzGraph -Query $Query -ErrorAction Stop
    
    $Result | Format-Table -AutoSize
    
    Write-Host "Query erfolgreich." -ForegroundColor Green

} catch {
    Write-Error "Fehler (Benötigt Az.ResourceGraph Modul): $_"
}
