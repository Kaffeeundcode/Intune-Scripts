<#
.SYNOPSIS
    Entfernt unerwünschte lokale Administratoren.
    (Intune Remediation Script)

.DESCRIPTION
    Entfernt alle User aus der Admin-Gruppe, die nicht auf der Allowed-Liste stehen.
    VORSICHT: Kann Admin-Rechte entziehen!

    Parameter:
    - AllowedUsers: Liste der User, die BLEIBEN dürfen.

.NOTES
    File Name: 046_Remediate-RemoveLocalAdmin.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [string[]]$AllowedUsers = @("Administrator", "Domain Admins", "AzureAD\TheUser")
)

try {
    $Members = Get-LocalGroupMember -Group "Administrators"

    foreach ($m in $Members) {
        if ($m.Name -notin $AllowedUsers -and $m.ObjectClass -eq "User") {
            Write-Host "Entferne Benutzer: $($m.Name)"
            Remove-LocalGroupMember -Group "Administrators" -Member $m.Name -ErrorAction Stop
        }
    }
    
    Write-Host "Bereinigung abgeschlossen."

} catch {
    Write-Error "Fehler: $_"
    exit 1
}
