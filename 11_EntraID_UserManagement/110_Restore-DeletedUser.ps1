<#
.SYNOPSIS
    Stellt einen gelöschten Benutzer wieder her.
    
.DESCRIPTION
    Holt einen Benutzer aus dem Papierkorb (Deleted Users) zurück.
    Erfordert die Berechtigung 'User.ReadWrite.All'.

.NOTES
    File Name: 110_Restore-DeletedUser.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [Parameter(Mandatory=$true)]
    [string]$UserPrincipalName
)

Connect-MgGraph -Scopes "User.ReadWrite.All"

$DeletedUser = Get-MgDirectoryDeletedItem -DirectoryObjectId $UserPrincipalName -ErrorAction SilentlyContinue
# Note: Get-MgDirectoryDeletedItem often takes ID. Searching by UPN in deleted items is harder.
# Filter scan for deleted items:
$DeletedUser = Get-MgDirectoryDeletedItemAsUser -All | Where-Object { $_.UserPrincipalName -eq $UserPrincipalName }

if ($DeletedUser) {
    Restore-MgDirectoryDeletedItem -DirectoryObjectId $DeletedUser.Id
    Write-Host "Benutzer wiederhergestellt." -ForegroundColor Green
} else {
    Write-Warning "Benutzer nicht im Papierkorb gefunden."
}
