<#
.SYNOPSIS
    Assigns an App to a Group with UNINSTALL intent.
    
.DESCRIPTION
    Forces removal of the app for users/devices in the target group.
    Requires 'DeviceManagementApps.ReadWrite.All' permission.

.NOTES
    File Name: 16_Assign-AppToGroup_Uninstall.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param(
    [Parameter(Mandatory=$true)]
    [string]$AppName,

    [Parameter(Mandatory=$true)]
    [string]$GroupId
)

Connect-MgGraph -Scopes "DeviceManagementApps.ReadWrite.All"

$App = Get-MgDeviceAppMgtMobileApp -Filter "displayName eq '$AppName'"
if ($App -is [array]) { $App = $App[0] }
if (-not $App) { Write-Error "App not found"; exit }

# Intent 3 = Uninstall
$Params = @{
    "@odata.type" = "#microsoft.graph.mobileAppAssignment"
    target = @{
        "@odata.type" = "#microsoft.graph.groupAssignmentTarget"
        groupId = $GroupId
    }
    intent = "uninstall"
}

try {
    New-MgDeviceAppMgtMobileAppAssignment -MobileAppId $App.Id -BodyParameter $Params
    Write-Host "Assigned '$AppName' UNINSTALL to Group '$GroupId'." -ForegroundColor Red
} catch {
    Write-Error "Assignment failed: $_"
}
