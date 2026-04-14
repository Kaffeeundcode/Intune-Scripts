<#
.SYNOPSIS
    Lists all available Directory Rules and Templates (Built-in Roles).

.DESCRIPTION
    Exports the definitions of all Entra ID text-based roles (e.g. "Global Administrator", "Helpdesk Admin").
    Includes the description and verify if they are enabled.
    Useful for understanding the RBAC landscape.

.NOTES
    File Name  : 119_Get-EntraIDDirectoryRoleTemplates.ps1
    Author     : Kaffeeundcode
    Version    : 1.0
#>

try {
    Connect-MgGraph -Scopes "RoleManagement.Read.Directory" -ErrorAction Stop
} catch {
    Write-Error "Login failed"
    exit
}

$Roles = Get-MgRoleManagementDirectoryRoleDefinition -All

$Report = @()

foreach ($Role in $Roles) {
    $Report += [PSCustomObject]@{
        RoleName = $Role.DisplayName
        Description = $Role.Description
        IsBuiltIn = $Role.IsBuiltIn
        Id = $Role.Id
        TemplateId = $Role.TemplateId
    }
}

$Report | Sort-Object RoleName | Format-Table RoleName, Description -AutoSize

$Path = "$PSScriptRoot\Directory_Role_Definitions.csv"
$Report | Export-Csv -Path $Path -NoTypeInformation
Write-Host "Exported to $Path" -ForegroundColor Green
