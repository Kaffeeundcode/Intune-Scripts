<#
.SYNOPSIS
    Zeigt Status (Enabled/Disabled/ReportOnly) von CA Policies.
    
.DESCRIPTION
    Schnelle Übersicht über aktive vs. inaktive Regeln.
    Erfordert die Berechtigung 'Policy.Read.All'.

.NOTES
    File Name: 133_Get-CAPolicyStatus.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param()

Get-MgIdentityConditionalAccessPolicy | Group-Object State | Select-Object Name, Count
