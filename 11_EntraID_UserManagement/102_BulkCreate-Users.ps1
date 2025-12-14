<#
.SYNOPSIS
    Erstellt mehrere Benutzer aus einer CSV-Datei.
    
.DESCRIPTION
    Importiert Benutzerdaten (DisplayName, UPN, Password, etc.) aus einer CSV und legt die Accounts an.
    Erfordert die Berechtigung 'User.ReadWrite.All'.

.NOTES
    File Name: 102_BulkCreate-Users.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [Parameter(Mandatory=$true)]
    [string]$CsvPath
)

Connect-MgGraph -Scopes "User.ReadWrite.All"

$Users = Import-Csv $CsvPath

foreach ($User in $Users) {
    $PasswordProfile = @{
        Password = $User.Password
        ForceChangePasswordNextSignIn = $true
    }
    
    $Params = @{
        DisplayName = $User.DisplayName
        UserPrincipalName = $User.UserPrincipalName
        MailNickname = $User.MailNickname
        AccountEnabled = $true
        PasswordProfile = $PasswordProfile
    }
    
    try {
        New-MgUser -BodyParameter $Params
        Write-Host "Benutzer erstellt: $($User.UserPrincipalName)" -ForegroundColor Green
    } catch {
        Write-Error "Fehler bei $($User.UserPrincipalName): $_"
    }
}
