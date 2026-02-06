<#
.SYNOPSIS
    Audits the usage of Scope Tags across Intune objects.

.DESCRIPTION
    Scope Tags are critical for RBAC (Role Based Access Control).
    This script retrieves all Scope Tags and then lists which Device Configs, Compliance Policies, 
    and Scripts are tagged with them.
    
    Helps ensure that restrictions are correctly applied to objects.

.NOTES
    File Name  : 107_Get-IntuneScopeTagInventory.ps1
    Author     : Kaffeeundcode
    Version    : 1.0
#>

try {
    Connect-MgGraph -Scopes "DeviceManagementRBAC.Read.All", "DeviceManagementConfiguration.Read.All" -ErrorAction Stop
} catch {
    Write-Error "Login failed"
    exit
}

Write-Host "Getting Scope Tags..." -ForegroundColor Cyan
$Tags = Get-MgDeviceManagementRoleScopeTag -All
$AllTagsRef = @{}
foreach ($t in $Tags) { $AllTagsRef[$t.Id] = $t.DisplayName }

# Define what we check
$ObjectTypes = @(
    "DeviceConfiguration",
    "Compliance",
    "Scripts",
    "WindowsAutopilotProfiles"
)

$Report = @()

foreach ($Type in $ObjectTypes) {
    Write-Host "Checking $Type..." -ForegroundColor Yellow
    $Items = $null
    
    switch ($Type) {
        "DeviceConfiguration" { $Items = Get-MgDeviceManagementDeviceConfiguration -All }
        "Compliance" { $Items = Get-MgDeviceManagementDeviceCompliancePolicy -All }
        "Scripts" { $Items = Get-MgDeviceManagementDeviceShellScript -All }
        "WindowsAutopilotProfiles" { $Items = Get-MgDeviceManagementWindowsAutopilotDeploymentProfile -All }
    }

    foreach ($Item in $Items) {
        # RoleScopeTagIds is the property
        if ($Item.RoleScopeTagIds) {
             foreach ($TagId in $Item.RoleScopeTagIds) {
                # 0 is Default
                $TagName = if ($TagId -eq "0") { "Default" } else { $AllTagsRef[$TagId] }
                
                $Report += [PSCustomObject]@{
                    ObjectType   = $Type
                    ObjectName   = $Item.DisplayName
                    ScopeTagId   = $TagId
                    ScopeTagName = $TagName
                }
             }
        } else {
             # No tags often implies Default accessible
             $Report += [PSCustomObject]@{
                 ObjectType = $Type
                 ObjectName = $Item.DisplayName
                 ScopeTagId = "0"
                 ScopeTagName = "Default (Implicit)"
             }
        }
    }
}

$Report | Group-Object ScopeTagName | Select-Object Name, Count | Format-Table -AutoSize

$Path = "$PSScriptRoot\Scope_Tag_Inventory.csv"
$Report | Export-Csv -Path $Path -NoTypeInformation
Write-Host "Inventory saved to $Path" -ForegroundColor Green
