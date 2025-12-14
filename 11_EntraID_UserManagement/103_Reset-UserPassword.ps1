<#
.SYNOPSIS
    Setzt das Passwort eines Benutzers zurück.
    
.DESCRIPTION
    Vergibt ein neues Passwort für einen existierenden Benutzer (Admin Reset).
    Erfordert die Berechtigung 'User.ReadWrite.All' oder 'Directory.AccessAsUser.All'.

.NOTES
    File Name: 103_Reset-UserPassword.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [Parameter(Mandatory=$true)]
    [string]$UserPrincipalName
)

Connect-MgGraph -Scopes "User.ReadWrite.All"

$NewPassword = Read-Host "Neues Passwort eingeben" -AsSecureString
# Convert secure string back to plain text for Graph API parameter (depends on context/method, MG cmdlets usually take object)
# Note: For security, handling plain text passwords in scripts should be minimized.
$BSTR = [System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($NewPassword)
$PlainPassword = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($BSTR)

$Params = @{
    passwordProfile = @{
        forceChangePasswordNextSignIn = $true
        password = $PlainPassword
    }
}

Update-MgUser -UserId $UserPrincipalName -BodyParameter $Params
Write-Host "Passwort für $UserPrincipalName zurückgesetzt." -ForegroundColor Yellow
