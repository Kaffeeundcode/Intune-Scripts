<#
.SYNOPSIS
    Audits the number of past versions for Key Vault Secrets.

.DESCRIPTION
    Excessive versions of secrets can clutter the vault.
    This script iterates through secrets and counts their disabled/historical versions.
    This is often a cleanup candidate.

.NOTES
    File Name  : 124_Get-AzKeyVaultSecretVersionHistory.ps1
    Author     : Kaffeeundcode
    Version    : 1.0
#>

Param(
    [string]$VaultName
)

if (-not $VaultName) {
    $Vaults = Get-AzKeyVault
    if ($Vaults) {
        $VaultName = $Vaults[0].VaultName 
        Write-Host "Auto-selecting first vault: $VaultName" -ForegroundColor Yellow
    } else {
        Write-Error "No Key Vaults found."
        exit
    }
}

$Secrets = Get-AzKeyVaultSecret -VaultName $VaultName
$Report = @()

foreach ($Secret in $Secrets) {
    # Get versions
    $Versions = Get-AzKeyVaultSecret -VaultName $VaultName -Name $Secret.Name -IncludeVersions
    
    $Count = $Versions.Count
    $Oldest = ($Versions | Sort-Object Created | Select-Object -First 1).Created
    
    $Report += [PSCustomObject]@{
        SecretName = $Secret.Name
        VersionCount = $Count
        LastUpdated = $Secret.Updated
        OldestVersion = $Oldest
    }
}

$Report | Sort-Object VersionCount -Descending | Format-Table SecretName, VersionCount, LastUpdated -AutoSize
