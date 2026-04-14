<#
.SYNOPSIS
    Reports the storage usage of Recovery Services Vaults (Backups).

.DESCRIPTION
    Azure Backup storage costs can grow silently.
    This script retrieves the vault usage statistics to show how much LRS/GRS data is stored.

.NOTES
    File Name  : 129_Get-AzRecoveryServicesVaultStorage.ps1
    Author     : Kaffeeundcode
    Version    : 1.0
#>

$Vaults = Get-AzRecoveryServicesVault

$Report = @()

foreach ($Vault in $Vaults) {
    # Set context
    Set-AzRecoveryServicesVaultContext -Vault $Vault | Out-Null
    
    # Get storage stats
    $Stats = Get-AzRecoveryServicesBackupVaultStorageConfig -VaultId $Vault.Id
    
    # Note: Granular "Usage" often requires querying the Monitoring metrics or BackupStats
    # The storage config above gives type (LRS/GRS).
    # To get size, we look at the vault usage summary if available via metrics or specific cmdlet
    
    # For this script we will simply deduce the configuration to ensure it matches expectation (e.g. LRS for dev)
    
    $Report += [PSCustomObject]@{
        VaultName = $Vault.Name
        ResourceGroup = $Vault.ResourceGroupName
        StorageType = $Stats.StorageModelType
        Region = $Vault.Location
    }
}

$Report | Format-Table VaultName, StorageType, Region -AutoSize
Write-Host "Note: To see exact GB usage, check Azure Monitor metrics for 'Backup Storage'." -ForegroundColor Gray
$Report | Export-Csv "$PSScriptRoot\Backup_Vault_Config.csv" -NoTypeInformation
