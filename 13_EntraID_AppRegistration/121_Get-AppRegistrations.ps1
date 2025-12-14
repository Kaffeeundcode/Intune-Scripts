<#
.SYNOPSIS
    Listet alle App Registrations auf.
    
.DESCRIPTION
    Ruft alle registrierten Anwendungen (Applications) im Tenant ab.
    Erfordert die Berechtigung 'Application.Read.All'.

.NOTES
    File Name: 121_Get-AppRegistrations.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param()

Connect-MgGraph -Scopes "Application.Read.All"

Get-MgApplication -All | Select-Object DisplayName, AppId, CreatedDateTime
