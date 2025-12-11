<#
.SYNOPSIS
    Ruft den App-Installationsstatus für einen bestimmten Benutzer ab.
    
.DESCRIPTION
    Zeigt den Installationsstatus für Apps an, die einem Benutzer zugewiesen sind.
    Erfordert die Berechtigung 'DeviceManagementApps.Read.All'.

.NOTES
    File Name: 19_Get-UserAppInstallStatus.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [Parameter(Mandatory=$true)]
    [string]$UserPrincipalName
)

Connect-MgGraph -Scopes "DeviceManagementApps.Read.All"

# Note: Graph API filtering by user UPN on app status is restricted. Usually, we filter by UserName.
$Statuses = Get-MgDeviceAppMgtMobileAppUserStatus -Filter "userPrincipalName eq '$UserPrincipalName'"

if ($Statuses) {
    $Statuses | Select-Object MobileAppDisplayName, InstallState, DeviceDisplayName, LastStatusChangeDateTime | Format-Table -AutoSize
} else {
    Write-Warning "Keine App-Status für $UserPrincipalName gefunden."
}
