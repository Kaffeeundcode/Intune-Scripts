<#
.SYNOPSIS
    Weist einem Benutzer eine Lizenz zu.
    
.DESCRIPTION
    Fügt dem Benutzer Lizenzen hinzu (SKU ID).
    Erfordert die Berechtigung 'User.ReadWrite.All'.

.NOTES
    File Name: 38_Assign-LicenseToUser.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [Parameter(Mandatory=$true)]
    [string]$UserPrincipalName,

    [Parameter(Mandatory=$true)]
    [string]$SkuId
)

Connect-MgGraph -Scopes "User.ReadWrite.All"

try {
    Set-MgUserLicense -UserId $UserPrincipalName -AddLicenses @{SkuId = $SkuId} -RemoveLicenses @()
    Write-Host "Lizenz zugewiesen." -ForegroundColor Green
} catch {
    Write-Error "Fehler: $_"
}
