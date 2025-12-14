<#
.SYNOPSIS
    Setzt den Manager für einen Benutzer.
    
.DESCRIPTION
    Definiert die hierarchische Beziehung (Vorgesetzter) im AD.
    Erfordert die Berechtigung 'User.ReadWrite.All'.

.NOTES
    File Name: 108_Set-UserManager.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [Parameter(Mandatory=$true)]
    [string]$UserUPN,
    
    [Parameter(Mandatory=$true)]
    [string]$ManagerUPN
)

Connect-MgGraph -Scopes "User.ReadWrite.All"

$User = Get-MgUser -UserId $UserUPN
$Manager = Get-MgUser -UserId $ManagerUPN

if ($User -and $Manager) {
    $Params = @{
        "@odata.id" = "https://graph.microsoft.com/v1.0/users/$($Manager.Id)"
    }
    Remove-MgUserManager -UserId $User.Id -ErrorAction SilentlyContinue # Clean old if needed
    Set-MgUserManagerByRef -UserId $User.Id -BodyParameter $Params
    Write-Host "Manager für $UserUPN gesetzt auf $ManagerUPN." -ForegroundColor Green
}
