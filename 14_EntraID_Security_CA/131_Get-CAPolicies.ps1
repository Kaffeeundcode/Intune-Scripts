<#
.SYNOPSIS
    Listet alle Conditional Access Policies auf.

.DESCRIPTION
    <!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Ruft alle bedingten Zugriffsregeln ab.
    Erfordert die Berechtigung 'Policy.Read.All'.

.NOTES
    File Name: 131_Get-CAPolicies.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param()

Connect-MgGraph -Scopes "Policy.Read.All"

Get-MgIdentityConditionalAccessPolicy | Select-Object DisplayName, State, CreatedDateTime
