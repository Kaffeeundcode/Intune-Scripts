<#
.SYNOPSIS
    Weist eine App einer Gruppe als 'Erforderlich' (Required) zu.
    
.DESCRIPTION
    Die Zielgruppe erhält die App zwangsweise installiert.
    Erfordert die Berechtigung 'DeviceManagementApps.ReadWrite.All'.

.NOTES
    File Name: 14_Assign-AppToGroup_Required.ps1
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
    intent = "required"
}

try {
    New-MgDeviceAppMgtMobileAppAssignment -MobileAppId $AppId -BodyParameter $Params
    Write-Host "App $AppId erfolgreich als REQUIRED zugewiesen an Gruppe $GroupId." -ForegroundColor Green
} catch {
    Write-Error "Zuweisungsfehler: $_"
}
