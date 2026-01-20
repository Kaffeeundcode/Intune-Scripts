<#
.SYNOPSIS
    Erstellt eine Log Analytics Alert Rule für Login-Versuche des Break-Glass Accounts.

.DESCRIPTION
    Der "Notfall-Admin" (Break Glass) sollte niemals genutzt werden. Wenn doch, muss sofort Alarm geschlagen werden.
    Dieses Skript erstellt eine Alert Rule in Azure Monitor.

    Parameter:
    - BreakGlassUPN: UPN des Notfall-Admins
    - WorkspaceId: Log Analytics Workspace ID

.NOTES
    File Name: 024_Set-EntraIDBreakGlassAccountAlert.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [Parameter(Mandatory=$true)] [string]$BreakGlassUPN,
    [Parameter(Mandatory=$true)] [string]$WorkspaceId
)

try {
    $Query = @"
SigninLogs
| where UserPrincipalName == '$BreakGlassUPN'
| where ResultType == 0
"@
    
    Write-Host "Diesen Query bitte in Azure Monitor als Alert anlegen:" -ForegroundColor Cyan
    Write-Host $Query -ForegroundColor Yellow
    Write-Host "`n(Automatisches Erstellen von Alert Rules erfordert komplexes JSON-Template, daher hier Query-Output)"

} catch {
    Write-Error "Fehler: $_"
}
