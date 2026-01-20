<#
.SYNOPSIS
    Zeigt an, welche Benutzer für Admin-Rollen "Berechtigt" (Eligible) sind (PIM).

.DESCRIPTION
    Wichtig für PIM-Validierung. Zeigt nicht die aktiven, sondern die möglichen Rollen.
    Benötigt PIM-Rechte.

    Parameter:
    - UserEmail: (Optional) Filter auf einen User.

.NOTES
    File Name: 029_Get-EntraIDRoleEligibleAssignments.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [Parameter(Mandatory=$false)] [string]$UserEmail
)

try {
    $Filter = $null
    if ($UserEmail) {
        $User = Get-MgUser -UserId $UserEmail
        $Filter = "principalId eq '$($User.Id)'"
    }

    Write-Host "Suche PIM Eligible Assignments..." -ForegroundColor Cyan

    # Beta oft notwendig für PIM v3
    $Assignments = Get-MgBetaRoleManagementDirectoryRoleEligibilitySchedule -Filter $Filter -All

    foreach ($assign in $Assignments) {
        # Role Definition auflösen
        $RoleDef = Get-MgBetaRoleManagementDirectoryRoleDefinition -UnifiedRoleDefinitionId $assign.RoleDefinitionId
        
        # Principal auflösen wenn nicht gefiltert
        $PrincipalName = $UserEmail
        if (-not $PrincipalName) {
            $PrincipalName = (Get-MgUser -UserId $assign.PrincipalId -ErrorAction SilentlyContinue).UserPrincipalName
        }

        [PSCustomObject]@{
            Role = $RoleDef.DisplayName
            User = $PrincipalName
            Status = $assign.Status
            AssignmentType = $assign.DirectoryScopeId # "/" means Global
        }
    } | Format-Table -AutoSize

} catch {
    Write-Error "Fehler (Benötigt MG-Beta & PIM Rechte): $_"
}
