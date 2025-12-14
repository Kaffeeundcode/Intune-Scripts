<#
.SYNOPSIS
    Aktualisiert Benutzerprofil-Informationen (Abteilung, Job Title etc.).
    
.DESCRIPTION
    Setzt Standardattribute eines AD-Benutzers.
    Erfordert die Berechtigung 'User.ReadWrite.All'.

.NOTES
    File Name: 106_Update-UserProfile.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [Parameter(Mandatory=$true)]
    [string]$UserPrincipalName,
    
    [string]$Department,
    [string]$JobTitle,
    [string]$OfficeLocation
)

Connect-MgGraph -Scopes "User.ReadWrite.All"

$Params = @{}
if ($Department) { $Params.Department = $Department }
if ($JobTitle) { $Params.JobTitle = $JobTitle }
if ($OfficeLocation) { $Params.OfficeLocation = $OfficeLocation }

if ($Params.Count -gt 0) {
    Update-MgUser -UserId $UserPrincipalName -BodyParameter $Params
    Write-Host "Profil aktualisiert." -ForegroundColor Green
} else {
    Write-Warning "Keine Parameter zum Aktualisieren angegeben."
}
