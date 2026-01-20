<#
.SYNOPSIS
    Ruft aktive PIM (Privileged Identity Management) Alerts ab.

.DESCRIPTION
    Zeigt Sicherheitswarnungen aus PIM an, z.B. wenn Administratoren keine MFA nutzen 
    oder Rollen außerhalb von PIM zugewiesen wurden.
    Benötigt Microsoft.Graph.Identity.Governance Modul.

    Parameter:
    - AlertLevel: (Optional) Filtert nach Schweregrad (High, Medium, Low). Default: Alle.

.NOTES
    File Name: 021_Get-EntraIDPIMAlerts.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [Parameter(Mandatory=$false)] 
    [ValidateSet("High","Medium","Low","All")]
    [string]$AlertLevel = "All"
)

try {
    # Hinweis: PIM Alerts sind via Graph API /beta erreichbar
    Write-Host "Verbinde mit Graph (Identity Governance)..." -ForegroundColor Cyan
    Connect-MgGraph -Scopes "PrivilegedAccess.Read.AzureADGroup" -ErrorAction SilentlyContinue

    Write-Host "Rufe PIM Alerts ab..." -ForegroundColor Cyan
    
    # Da reines PIM Alert cmdlet in v1.0 rar ist, nutzen wir oft Invoke-MgGraphRequest für volle Details
    # Hier vereinfacht über Beta-Profil oder Invoke
    
    $Uri = "https://graph.microsoft.com/beta/privilegedAccess/aadRoles/alerts"
    $Alerts = Invoke-MgGraphRequest -Method GET -Uri $Uri -ErrorAction Stop
    
    $Results = $Alerts.value | Select-Object id, alertLevel, isRemediatable, severity, status

    if ($AlertLevel -ne "All") {
        $Results = $Results | Where-Object severity -eq $AlertLevel
    }

    if ($Results) {
        $Results | Format-Table -AutoSize
    } else {
        Write-Host "Keine PIM Alerts gefunden." -ForegroundColor Green
    }

} catch {
    Write-Error "Fehler: $_"
}
