<#
.SYNOPSIS
    Sucht nötige Permissions für eine Aktion.
    
.DESCRIPTION
    Find-MgGraphCommand hilft, die nötigen Scopes zu finden.
    
.NOTES
    File Name: 89_Get-GraphPermissions.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [string]$CommandName = "Get-MgDeviceManagementManagedDevice"
)

Find-MgGraphCommand -Command $CommandName | Select-Object Command, Permissions
