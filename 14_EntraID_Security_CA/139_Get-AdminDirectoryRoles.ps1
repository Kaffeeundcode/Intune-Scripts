<#
.SYNOPSIS
    Listet alle Directory Rollen auf.

.DESCRIPTION
    <!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Zeigt verfügbare Admin-Rollen und ob sie aktiviert sind.
    Erfordert die Berechtigung 'RoleManagement.Read.Directory'.

.NOTES
    File Name: 139_Get-AdminDirectoryRoles.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param()

Connect-MgGraph -Scopes "RoleManagement.Read.Directory"

Get-MgDirectoryRole | Select-Object DisplayName, Description
