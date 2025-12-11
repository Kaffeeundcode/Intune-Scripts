<#
.SYNOPSIS
    Beispiel für Paging (Blättern) durch Ergebnisse.
    
.DESCRIPTION
    Zeigt, wie man mehr als 1000 Ergebnisse durchläuft (NextLink).
    Die Cmdlets machen das oft automatisch (-All), hier manuell.

.NOTES
    File Name: 87_Get-PagingResults.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param()

Connect-MgGraph

$Uri = "https://graph.microsoft.com/v1.0/users?`$top=5"
do {
    $Result = Invoke-MgGraphRequest -Method GET -Uri $Uri
    $Result.value | ForEach-Object { Write-Host $_.userPrincipalName }
    $Uri = $Result.'@odata.nextLink'
} while ($Uri)
