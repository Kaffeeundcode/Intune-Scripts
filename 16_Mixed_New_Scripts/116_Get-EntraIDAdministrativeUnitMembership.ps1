<#
.SYNOPSIS
    Reports on Administrative Unit (AU) membership and their assigned roles.

.DESCRIPTION
    Administrative Units are used for delegated administration.
    This script lists all AUs, the members inside them, and which roles are scoped
    to that specific unit.

.NOTES
    File Name  : 116_Get-EntraIDAdministrativeUnitMembership.ps1
    Author     : Kaffeeundcode
    Version    : 1.0
#>

try {
    Connect-MgGraph -Scopes "Directory.Read.All", "RoleManagement.Read.Directory" -ErrorAction Stop
} catch {
    Write-Error "Login failed"
    exit
}

Write-Host "Getting Administrative Units..." -ForegroundColor Cyan
$AUs = Get-MgDirectoryAdministrativeUnit -All

$Report = @()

foreach ($AU in $AUs) {
    Write-Host "Processing AU: $($AU.DisplayName)" -ForegroundColor Yellow
    
    # Get Members (Users/Groups/Devices)
    $Members = Get-MgDirectoryAdministrativeUnitMember -AdministrativeUnitId $AU.Id -All
    $UserCount = ($Members | Where-Object { $_.AdditionalProperties["@odata.type"] -match "user" }).Count
    $DeviceCount = ($Members | Where-Object { $_.AdditionalProperties["@odata.type"] -match "device" }).Count
    $GroupCount = ($Members | Where-Object { $_.AdditionalProperties["@odata.type"] -match "group" }).Count

    # Get Scoped Role Assignments (Who is admin of this AU?)
    $ScopedAdmins = Get-MgDirectoryAdministrativeUnitScopedRoleMember -AdministrativeUnitId $AU.Id -All
    
    $AdminNames = @()
    foreach ($SA in $ScopedAdmins) {
        # Fetch Role Def Name
        $RoleDef = Get-MgRoleManagementDirectoryRoleDefinition -UnifiedRoleDefinitionId $SA.RoleDefinitionId 
        # Fetch User Name
        try {
            $User = Get-MgUser -UserId $SA.RoleMemberInfo.Id -ErrorAction SilentlyContinue
            if ($User) { $AdminNames += "$($User.DisplayName) ($($RoleDef.DisplayName))" }
        } catch {}
    }

    $Report += [PSCustomObject]@{
        AU_Name = $AU.DisplayName
        AU_Id = $AU.Id
        Description = $AU.Description
        MemberUsers = $UserCount
        MemberDevices = $DeviceCount
        MemberGroups = $GroupCount
        DelegatedAdmins = ($AdminNames -join "; ")
    }
}

$Report | Format-Table AU_Name, MemberUsers, DelegatedAdmins -AutoSize
$Path = "$PSScriptRoot\AU_Inventory.csv"
$Report | Export-Csv -Path $Path -NoTypeInformation
Write-Host "Saved to $Path" -ForegroundColor Green
