<#
.SYNOPSIS
    Erteilt Admin Consent für Permissions.
    
.DESCRIPTION
    Genehmigt angeforderte Berechtigungen für eine App/Service Principal.
    Erfordert die Berechtigung 'AppRoleAssignment.ReadWrite.All' oder Global Admin.

.NOTES
    File Name: 125_Grant-AdminConsent.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

Write-Warning "Admin Consent via Graph API ist komplex (OAuth2PermissionGrant). Bitte Portal nutzen."
# Implementation would require New-MgOauth2PermissionGrant
