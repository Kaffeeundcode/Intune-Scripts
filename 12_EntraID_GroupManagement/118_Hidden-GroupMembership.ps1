<#
.SYNOPSIS
    Erstellt eine Gruppe mit versteckter Mitgliedschaft (HiddenMembership).

.DESCRIPTION
    <!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Erstellt eine M365/Security Gruppe, deren Mitglieder für User nicht sichtbar sind.
    Erfordert die Berechtigung 'Group.ReadWrite.All'.

.NOTES
    File Name: 118_Hidden-GroupMembership.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [string]$GroupName
)

Connect-MgGraph -Scopes "Group.ReadWrite.All"

$Params = @{
    displayName = $GroupName
    mailEnabled = $false
    mailNickname = ($GroupName -replace " ", "")
    securityEnabled = $true
    visibility = "HiddenMembership"
}

New-MgGroup -BodyParameter $Params
Write-Host "Gruppe mit hidden membership erstellt." -ForegroundColor Green
