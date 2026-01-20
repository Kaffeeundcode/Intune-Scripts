<#
.SYNOPSIS
    Weist eine Teams Meeting Policy einer Liste von Benutzern zu.

.DESCRIPTION
    Bulk-Assignment von Policies ist oft schneller via PowerShell als im Admin Center.
    
    Parameter:
    - PolicyName: Name der Policy (z.B. "Global" oder Custom Name)
    - UserList: Array von UPNs (oder aus CSV importiert vor dem Aufruf).

.NOTES
    File Name: 062_Set-TeamsMeetingPolicyBulk.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [Parameter(Mandatory=$true)] [string]$PolicyName,
    [Parameter(Mandatory=$true)] [string[]]$UserList
)

try {
    Write-Host "Verteile Policy '$PolicyName' an $($UserList.Count) User..." -ForegroundColor Cyan

    # Benötigt MicrosoftTeams Modul
    
    foreach ($user in $UserList) {
        Write-Host "Setze Policy für $user..." -NoNewline
        try {
            Grant-CsTeamsMeetingPolicy -Identity $user -PolicyName $PolicyName -ErrorAction Stop
            Write-Host " OK" -ForegroundColor Green
        } catch {
            Write-Host " FEHLER: $_" -ForegroundColor Red
        }
    }

    # Batch-Cmdlet wäre New-CsBatchPolicyAssignmentOperation für >100 User
    Write-Host "Vorgang abgeschlossen."

} catch {
    Write-Error "Fehler: $_"
}
