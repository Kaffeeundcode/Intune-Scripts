<#
.SYNOPSIS
    Gets the assignments for a specific App.
    
.DESCRIPTION
    Shows which groups this app is assigned to (Required, Available, or Uninstall).
    Requires 'DeviceManagementApps.Read.All' permission.

.NOTES
    File Name: 13_Get-AppAssignments.ps1
    Author: Kaffee & Code Assistant
    Version: 1.0
#>

param(
    [Parameter(Mandatory=$true)]
    [string]$AppName
)

Connect-MgGraph -Scopes "DeviceManagementApps.Read.All"

# Helper to find app ID first
$App = Get-MgDeviceAppMgtMobileApp -Filter "displayName eq '$AppName'" -ErrorAction SilentlyContinue

# If multiple apps found with same name, pick first or warn
if ($App -is [array]) { 
    Write-Warning "Multiple apps found with name '$AppName'. Using the first one."
    $App = $App[0]
}

if ($App) {
    Write-Host "Checking assignments for: $($App.DisplayName)" -ForegroundColor Cyan
    # Assignments are a relationship
    $Assignments = Get-MgDeviceAppMgtMobileAppAssignment -MobileAppId $App.Id
    
    if ($Assignments) {
        foreach ($Assign in $Assignments) {
            # Intent: 1=Required, 2=Available, 3=Uninstall
            $IntentStr = switch ($Assign.Intent) {
                1 { "Required" }
                2 { "Available" }
                3 { "Uninstall" }
                Default { "Unknown" }
            }
            # Target may be a group or all users/devices. 
            # If it's a group, we might want to resolve the Group ID, but simplest is to show the Target Object.
            Write-Host "Intent: $IntentStr | Target: $($Assign.Target.GetType().Name)"
        }
    } else {
        Write-Host "No assignments found." -ForegroundColor Yellow
    }
} else {
    Write-Warning "App '$AppName' not found."
}
