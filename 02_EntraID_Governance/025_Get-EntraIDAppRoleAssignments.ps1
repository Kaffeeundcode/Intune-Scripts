<#
.SYNOPSIS
    Listet alle Benutzer und Gruppen auf, die einer Enterprise App zugewiesen sind.

.DESCRIPTION
    Zeigt, wer Zugriff auf eine bestimmte App hat.
    
    Parameter:
    - AppParams: Name der Applikation (DisplayName)

.NOTES
    File Name: 025_Get-EntraIDAppRoleAssignments.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [Parameter(Mandatory=$true)] [string]$AppDisplayName
)

try {
    $SP = Get-MgServicePrincipal -Filter "displayName eq '$AppDisplayName'" -ErrorAction Stop
    if (-not $SP) { Throw "App nicht gefunden." }
    
    Write-Host "App ID: $($SP.Id)" -ForegroundColor Cyan
    
    Get-MgServicePrincipalAppRoleAssignedTo -ServicePrincipalId $SP.Id -All | ForEach-Object {
        [PSCustomObject]@{
            PrincipalDisplayName = $_.PrincipalDisplayName
            PrincipalType = $_.PrincipalType
            AppRoleId = $_.AppRoleId
        }
    } | Format-Table

} catch {
    Write-Error "Fehler: $_"
}
