<#
.SYNOPSIS
    Listet Enterprise Applications (Service Principals) auf.
    
.DESCRIPTION
    Unterschied zu App Registration: Dies sind die Instanzen im lokalen Tenant.
    Erfordert die Berechtigung 'Application.Read.All'.

.NOTES
    File Name: 126_Get-ServicePrincipals.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param()

Connect-MgGraph -Scopes "Application.Read.All"

Get-MgServicePrincipal -All | Select-Object DisplayName, AppId, ServicePrincipalType
