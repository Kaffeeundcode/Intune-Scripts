<#
.SYNOPSIS
    Erkennt neu registrierte Apps (Shadow IT Detection).
    
.DESCRIPTION
    Listet Apps auf, die in den letzten 7 Tagen registriert wurden.
    Erfordert die Berechtigung 'Application.Read.All'.

.NOTES
    File Name: 140_Detect-ShadowIT-Apps.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param()

Connect-MgGraph -Scopes "Application.Read.All"
$Date = (Get-Date).AddDays(-7)

Get-MgApplication -All | Where-Object { $_.CreatedDateTime -gt $Date } | Select-Object DisplayName, CreatedDateTime, PublisherDomain
