<#
.SYNOPSIS
    Prüft die Aufbewahrungsdauer (Retention) von Log Analytics Workspaces.

.DESCRIPTION
    Eine zu lange Retention kann hohe Kosten verursachen.
    Dieses Skript listet alle Workspaces und deren Retention in Tagen auf.

.NOTES
    File Name: 081_Get-AzLogAnalyticsRetention.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

try {
    Write-Host "Prüfe Log Analytics Workspaces..." -ForegroundColor Cyan

    $Workspaces = Get-AzOperationalInsightsWorkspace
    
    foreach ($ws in $Workspaces) {
        Write-Host "Workspace: $($ws.Name) (RG: $($ws.ResourceGroupName))" -ForegroundColor Yellow
        Write-Host " - Retention: $($ws.RetentionInDays) Tage"
        Write-Host " - Sku:       $($ws.Sku)"
        
        if ($ws.RetentionInDays -gt 365) {
            Write-Warning "   ACHTUNG: Retention > 1 Jahr! Kosten prüfen."
        }
    }

} catch {
    Write-Error "Fehler: $_"
}
