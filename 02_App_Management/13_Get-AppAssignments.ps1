<#
.SYNOPSIS
    Ruft die Zuweisungen für eine bestimmte App ab.
    
.DESCRIPTION
    Zeigt an, welchen Gruppen diese App zugewiesen ist (Required, Available oder Uninstall).
    Erfordert die Berechtigung 'DeviceManagementApps.Read.All'.

.NOTES
    File Name: 13_Get-AppAssignments.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [Parameter(Mandatory=$true)]
    [string]$AppId
)

Connect-MgGraph -Scopes "DeviceManagementApps.Read.All"

try {
    # Assignments are sub-objects
    $Assignments = Get-MgDeviceAppMgtMobileAppAssignment -MobileAppId $AppId
    
    if ($Assignments) {
        Write-Host "Zuweisungen für App $AppId:"
        foreach ($Assign in $Assignments) {
            $Intent = $Assign.Intent
            $GroupId = $Assign.Target.GroupId
            Write-Host " - Gruppe: $GroupId | Intent: $Intent"
        }
    } else {
        Write-Warning "Keine Zuweisungen gefunden."
    }
} catch {
    Write-Error "Fehler beim Abruf: $_"
}
