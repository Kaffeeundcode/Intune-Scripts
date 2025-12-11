<#
.SYNOPSIS
    Weist eine App einer Gruppe als 'Verfügbar' (Available) zu.
    
.DESCRIPTION
    Benutzer der Zielgruppe können die App über das Unternehmensportal selbst installieren.
    Erfordert die Berechtigung 'DeviceManagementApps.ReadWrite.All'.

.NOTES
    File Name: 15_Assign-AppToGroup_Available.ps1
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
    intent = "available"
}

try {
    New-MgDeviceAppMgtMobileAppAssignment -MobileAppId $AppId -BodyParameter $Params
    Write-Host "App $AppId erfolgreich als AVAILABLE zugewiesen an Gruppe $GroupId." -ForegroundColor Green
} catch {
    Write-Error "Zuweisungsfehler: $_"
}
