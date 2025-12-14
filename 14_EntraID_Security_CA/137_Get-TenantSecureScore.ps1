<#
.SYNOPSIS
    Ruft den Identity Secure Score ab.
    
.DESCRIPTION
    Zeigt den aktuellen Sicherheits-Score des Tenants.
    Erfordert die Berechtigung 'SecurityEvents.Read.All' (variiert).

.NOTES
    File Name: 137_Get-TenantSecureScore.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param()

Connect-MgGraph -Scopes "SecurityEvents.Read.All"

Get-MgSecuritySecureScore -Top 1 | Select-Object CreatedDateTime, CurrentScore, MaxScore
