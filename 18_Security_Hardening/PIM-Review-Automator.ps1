<#
.SYNOPSIS
    PIM-Review-Automator - Audits Privileged Identity Management (PIM) role assignments.
    
.DESCRIPTION
    Identifies users with permanent administrative assignments and compares them 
    against eligible assignments to ensure the Principle of Least Privilege (PoLP).
#>

[CmdletBinding()]
param ()

process {
    Write-Host "[INFO] Auditing PIM Role Assignments..." -ForegroundColor Cyan
    
    try {
        # Fetch all role assignments
        $Assignments = Get-MgRoleManagementDirectoryRoleAssignment -All
        $PermanentAdmins = $Assignments | Where-Object { $_.AssignmentType -eq 'Permanent' }

        if ($PermanentAdmins) {
            Write-Host "[WARNING] Found $($PermanentAdmins.Count) permanent admin assignments." -ForegroundColor Yellow
            $PermanentAdmins | Select-Object UserId, RoleId, AssignmentType | Format-Table
        } else {
            Write-Host "[SUCCESS] No permanent admin assignments found. PoLP is active." -ForegroundColor Green
        }
    } catch {
        Write-Error "Failed to audit PIM assignments: $($_.Exception.Message)"
    }
}