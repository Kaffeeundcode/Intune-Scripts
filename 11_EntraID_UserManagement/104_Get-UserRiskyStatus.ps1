<#
.SYNOPSIS
    Prüft, ob Benutzer als "Risky Users" markiert sind (Identity Protection).

.DESCRIPTION
    <!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Zeigt Benutzer mit hohem oder mittlerem Risiko-Level.
    Erfordert die Berechtigung 'IdentityRiskEvent.Read.All'.

.NOTES
    File Name: 104_Get-UserRiskyStatus.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param()

Connect-MgGraph -Scopes "IdentityRiskEvent.Read.All"

Get-MgRiskyUser -Filter "riskLevel eq 'high' or riskLevel eq 'medium'" | Select-Object UserPrincipalName, RiskLevel, RiskState, RiskDetail
