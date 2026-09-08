<#
.SYNOPSIS
    Listet Consent Policies (App Permissions) auf.

.DESCRIPTION
    <!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Zeigt Richtlinien für User Consent zu Apps.
    Erfordert die Berechtigung 'Policy.Read.All'.

.NOTES
    File Name: 138_List-ConsentGrantPolicies.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param()

Connect-MgGraph -Scopes "Policy.Read.All"
Get-MgPolicyPermissionGrantPolicy
