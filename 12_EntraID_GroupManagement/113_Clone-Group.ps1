<#
.SYNOPSIS
    Klont eine statische Gruppe (nur Struktur, keine Mitglieder).
    
.DESCRIPTION
    Erstellt eine neue leere Gruppe mit demselben Namen (+ Copy) und Beschreibung.
    Erfordert die Berechtigung 'Group.ReadWrite.All'.

.NOTES
    File Name: 113_Clone-Group.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [Parameter(Mandatory=$true)]
    [string]$SourceGroupName
)

Connect-MgGraph -Scopes "Group.ReadWrite.All"

$Source = Get-MgGroup -Filter "displayName eq '$SourceGroupName'"
if ($Source) {
    $NewName = "$($Source.DisplayName)_Copy"
    $Params = @{
        displayName = $NewName
        mailEnabled = $false
        mailNickname = ($NewName -replace " ", "")
        securityEnabled = $true
        description = "Klon von $($Source.Id)"
    }
    New-MgGroup -BodyParameter $Params
    Write-Host "Gruppe geklont: $NewName" -ForegroundColor Green
}
