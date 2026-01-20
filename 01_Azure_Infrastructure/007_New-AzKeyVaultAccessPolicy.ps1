<#
.SYNOPSIS
    Fügt eine Access Policy zu einem Azure KeyVault hinzu.

.DESCRIPTION
    Gewährt einem Benutzer oder Service Principal (SPN) Zugriff auf Secrets/Keys/Zertifikate in einem KeyVault.
    
    Parameter:
    - VaultName: Name des KeyVaults
    - ResourceGroupName: RG des KeyVaults
    - UserEmail: (Optional) E-Mail (UPN) eines Benutzers
    - ObjectId: (Optional) Object ID eines Benutzers/SPN/Gruppe
    - PermissionsToSecrets: Array von Rechten (z.B. Get, List, Set, Delete)

.NOTES
    File Name: 007_New-AzKeyVaultAccessPolicy.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [Parameter(Mandatory=$true)] [string]$VaultName,
    [Parameter(Mandatory=$true)] [string]$ResourceGroupName,
    [Parameter(Mandatory=$false)] [string]$UserEmail,
    [Parameter(Mandatory=$false)] [string]$ObjectId,
    [Parameter(Mandatory=$false)] [string[]]$PermissionsToSecrets = @("Get", "List")
)

try {
    if (-not $UserEmail -and -not $ObjectId) {
        Throw "Sie müssen entweder -UserEmail oder -ObjectId angeben."
    }

    Write-Host "Setze Berechtigungen für KeyVault '$VaultName'..." -ForegroundColor Cyan

    $Params = @{
        VaultName = $VaultName
        ResourceGroupName = $ResourceGroupName
        PermissionsToSecrets = $PermissionsToSecrets
        ErrorAction = "Stop"
    }

    if ($UserEmail) {
        $Params.Add("UserPrincipalName", $UserEmail)
        Write-Host " -> Benutzer: $UserEmail"
    } else {
        $Params.Add("ObjectId", $ObjectId)
        Write-Host " -> ObjectId: $ObjectId"
    }

    Set-AzKeyVaultAccessPolicy @Params | Out-Null
    Write-Host "Berechtigungen erfolgreich gesetzt." -ForegroundColor Green

} catch {
    Write-Error "Fehler beim Setzen der Policy: $_"
}
