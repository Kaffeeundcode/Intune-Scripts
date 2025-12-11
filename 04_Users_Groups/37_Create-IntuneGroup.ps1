<#
.SYNOPSIS
    Erstellt eine neue Sicherheitsgruppe für Intune.
    
.DESCRIPTION
    Legt eine neue Azure AD Security Group an.
    Erfordert die Berechtigung 'Group.ReadWrite.All'.

.NOTES
    File Name: 37_Create-IntuneGroup.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [Parameter(Mandatory=$true)]
    [string]$GroupName,

    [string]$Description = "Erstellt via PowerShell"
)

Connect-MgGraph -Scopes "Group.ReadWrite.All"

$Params = @{
    displayName = $GroupName
    mailEnabled = $false
    mailNickname = ($GroupName -replace " ", "")
    securityEnabled = $true
    description = $Description
}

try {
    $Group = New-MgGroup -BodyParameter $Params
    Write-Host "Gruppe erstellt: $($Group.Id)" -ForegroundColor Green
} catch {
    Write-Error "Fehler beim Erstellen: $_"
}
