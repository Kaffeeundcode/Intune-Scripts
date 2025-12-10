<#
.SYNOPSIS
    Assigns an App to a Group as AVAILABLE (for enrollment).
    
.DESCRIPTION
    Users in the target group can install the app from Company Portal.
    Requires 'DeviceManagementApps.ReadWrite.All' permission.

.NOTES
    File Name: 15_Assign-AppToGroup_Available.ps1
    Author: Kaffee & Code Assistant
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

# Intent 2 = Available
$Params = @{
    "@odata.type" = "#microsoft.graph.mobileAppAssignment"
    target = @{
        "@odata.type" = "#microsoft.graph.groupAssignmentTarget"
        groupId = $GroupId
    }
    intent = "available" # or "availableForInstall"
}

try {
    New-MgDeviceAppMgtMobileAppAssignment -MobileAppId $App.Id -BodyParameter $Params
    Write-Host "Assigned '$AppName' as AVAILABLE to Group '$GroupId'." -ForegroundColor Green
} catch {
    Write-Error "Assignment failed: $_"
}
