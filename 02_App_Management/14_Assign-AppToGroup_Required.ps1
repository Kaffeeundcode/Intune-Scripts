<#
.SYNOPSIS
    Assigns an App to a Group as REQUIRED.
    
.DESCRIPTION
    Target group will have the app forced installed.
    Requires 'DeviceManagementApps.ReadWrite.All' permission.

.NOTES
    File Name: 14_Assign-AppToGroup_Required.ps1
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

# Find App
$App = Get-MgDeviceAppMgtMobileApp -Filter "displayName eq '$AppName'"
if ($App -is [array]) { $App = $App[0] }
if (-not $App) { Write-Error "App not found"; exit }

# Prepare Assignment
# Intent 1 = Required
$Params = @{
    "@odata.type" = "#microsoft.graph.mobileAppAssignment"
    target = @{
        "@odata.type" = "#microsoft.graph.groupAssignmentTarget"
        groupId = $GroupId
    }
    intent = "required"
}

try {
    New-MgDeviceAppMgtMobileAppAssignment -MobileAppId $App.Id -BodyParameter $Params
    Write-Host "Assigned '$AppName' as REQUIRED to Group '$GroupId'." -ForegroundColor Green
} catch {
    Write-Error "Assignment failed: $_"
}
