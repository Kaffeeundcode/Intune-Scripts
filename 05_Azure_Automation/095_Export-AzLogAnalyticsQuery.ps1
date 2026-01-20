<#
.SYNOPSIS
    Führt eine KQL Query gegen Log Analytics aus und exportiert das Ergebnis als CSV.

.DESCRIPTION
    Automatisiert Reportings aus Logs (z.B. Security Events, Performance).
    
    Parameter:
    - WorkspaceId: ID des Workspaces
    - Query: KQL Abfrage
    - OutputFile: Ziel-CSV

.NOTES
    File Name: 095_Export-AzLogAnalyticsQuery.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [Parameter(Mandatory=$true)] [string]$WorkspaceId,
    [Parameter(Mandatory=$true)] [string]$Query,
    [Parameter(Mandatory=$false)] [string]$OutputFile = "$HOME/Desktop/QueryResults.csv"
)

try {
    Write-Host "Führe Query aus..." -ForegroundColor Cyan

    $Result = Invoke-AzOperationalInsightsQuery -WorkspaceId $WorkspaceId -Query $Query -ErrorAction Stop
    
    if ($Result.Results) {
        $Result.Results | Export-Csv -Path $OutputFile -NoTypeInformation -Encoding UTF8
        Write-Host "Ergebnisse exportiert nach: $OutputFile" -ForegroundColor Green
    } else {
        Write-Warning "Keine Ergebnisse für diese Query."
    }

} catch {
    Write-Error "Fehler: $_"
}
