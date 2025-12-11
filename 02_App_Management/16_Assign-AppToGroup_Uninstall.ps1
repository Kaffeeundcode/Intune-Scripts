<#
.SYNOPSIS
    Weist eine App einer Gruppe mit der Absicht 'Uninstall' (Deinstallieren) zu.
    
.DESCRIPTION
    Erzwingt die Entfernung der App für Benutzer/Geräte in der Zielgruppe.
    Erfordert die Berechtigung 'DeviceManagementApps.ReadWrite.All'.

.NOTES
    File Name: 16_Assign-AppToGroup_Uninstall.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [Parameter(Mandatory=$true)]
    [string]$AppId,

    [Parameter(Mandatory=$true)]
    [string]$GroupId
)

Connect-MgGraph -Scopes "DeviceManagementApps.ReadWrite.All"

$Params = @{
    "@odata.type" = "#microsoft.graph.mobileAppAssignment"
    target = @{
        "@odata.type" = "#microsoft.graph.groupAssignmentTarget"
        groupId = $GroupId
    }
    intent = "uninstall"
}

try {
    New-MgDeviceAppMgtMobileAppAssignment -MobileAppId $AppId -BodyParameter $Params
    Write-Host "App $AppId erfolgreich zur DEINSTALLATION zugewiesen an Gruppe $GroupId." -ForegroundColor Yellow
} catch {
    Write-Error "Zuweisungsfehler: $_"
}
